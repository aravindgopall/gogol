{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE NoImplicitPrelude  #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}
{-# LANGUAGE TypeOperators      #-}

{-# OPTIONS_GHC -fno-warn-duplicate-exports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds      #-}
{-# OPTIONS_GHC -fno-warn-unused-imports    #-}

-- |
-- Module      : Network.Google.Resource.CloudFunctions.Projects.Locations.Functions.GetIAMPolicy
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Gets the access control policy for a resource. Returns an empty policy
-- if the resource exists and does not have a policy set.
--
-- /See:/ <https://cloud.google.com/functions Cloud Functions API Reference> for @cloudfunctions.projects.locations.functions.getIamPolicy@.
module Network.Google.Resource.CloudFunctions.Projects.Locations.Functions.GetIAMPolicy
    (
    -- * REST Resource
      ProjectsLocationsFunctionsGetIAMPolicyResource

    -- * Creating a Request
    , projectsLocationsFunctionsGetIAMPolicy
    , ProjectsLocationsFunctionsGetIAMPolicy

    -- * Request Lenses
    , plfgipXgafv
    , plfgipUploadProtocol
    , plfgipAccessToken
    , plfgipUploadType
    , plfgipResource
    , plfgipCallback
    ) where

import           Network.Google.CloudFunctions.Types
import           Network.Google.Prelude

-- | A resource alias for @cloudfunctions.projects.locations.functions.getIamPolicy@ method which the
-- 'ProjectsLocationsFunctionsGetIAMPolicy' request conforms to.
type ProjectsLocationsFunctionsGetIAMPolicyResource =
     "v1" :>
       CaptureMode "resource" "getIamPolicy" Text :>
         QueryParam "$.xgafv" Xgafv :>
           QueryParam "upload_protocol" Text :>
             QueryParam "access_token" Text :>
               QueryParam "uploadType" Text :>
                 QueryParam "callback" Text :>
                   QueryParam "alt" AltJSON :> Get '[JSON] Policy

-- | Gets the access control policy for a resource. Returns an empty policy
-- if the resource exists and does not have a policy set.
--
-- /See:/ 'projectsLocationsFunctionsGetIAMPolicy' smart constructor.
data ProjectsLocationsFunctionsGetIAMPolicy =
  ProjectsLocationsFunctionsGetIAMPolicy'
    { _plfgipXgafv          :: !(Maybe Xgafv)
    , _plfgipUploadProtocol :: !(Maybe Text)
    , _plfgipAccessToken    :: !(Maybe Text)
    , _plfgipUploadType     :: !(Maybe Text)
    , _plfgipResource       :: !Text
    , _plfgipCallback       :: !(Maybe Text)
    }
  deriving (Eq, Show, Data, Typeable, Generic)

-- | Creates a value of 'ProjectsLocationsFunctionsGetIAMPolicy' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'plfgipXgafv'
--
-- * 'plfgipUploadProtocol'
--
-- * 'plfgipAccessToken'
--
-- * 'plfgipUploadType'
--
-- * 'plfgipResource'
--
-- * 'plfgipCallback'
projectsLocationsFunctionsGetIAMPolicy
    :: Text -- ^ 'plfgipResource'
    -> ProjectsLocationsFunctionsGetIAMPolicy
projectsLocationsFunctionsGetIAMPolicy pPlfgipResource_ =
  ProjectsLocationsFunctionsGetIAMPolicy'
    { _plfgipXgafv = Nothing
    , _plfgipUploadProtocol = Nothing
    , _plfgipAccessToken = Nothing
    , _plfgipUploadType = Nothing
    , _plfgipResource = pPlfgipResource_
    , _plfgipCallback = Nothing
    }

-- | V1 error format.
plfgipXgafv :: Lens' ProjectsLocationsFunctionsGetIAMPolicy (Maybe Xgafv)
plfgipXgafv
  = lens _plfgipXgafv (\ s a -> s{_plfgipXgafv = a})

-- | Upload protocol for media (e.g. \"raw\", \"multipart\").
plfgipUploadProtocol :: Lens' ProjectsLocationsFunctionsGetIAMPolicy (Maybe Text)
plfgipUploadProtocol
  = lens _plfgipUploadProtocol
      (\ s a -> s{_plfgipUploadProtocol = a})

-- | OAuth access token.
plfgipAccessToken :: Lens' ProjectsLocationsFunctionsGetIAMPolicy (Maybe Text)
plfgipAccessToken
  = lens _plfgipAccessToken
      (\ s a -> s{_plfgipAccessToken = a})

-- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
plfgipUploadType :: Lens' ProjectsLocationsFunctionsGetIAMPolicy (Maybe Text)
plfgipUploadType
  = lens _plfgipUploadType
      (\ s a -> s{_plfgipUploadType = a})

-- | REQUIRED: The resource for which the policy is being requested. See the
-- operation documentation for the appropriate value for this field.
plfgipResource :: Lens' ProjectsLocationsFunctionsGetIAMPolicy Text
plfgipResource
  = lens _plfgipResource
      (\ s a -> s{_plfgipResource = a})

-- | JSONP
plfgipCallback :: Lens' ProjectsLocationsFunctionsGetIAMPolicy (Maybe Text)
plfgipCallback
  = lens _plfgipCallback
      (\ s a -> s{_plfgipCallback = a})

instance GoogleRequest
           ProjectsLocationsFunctionsGetIAMPolicy
         where
        type Rs ProjectsLocationsFunctionsGetIAMPolicy =
             Policy
        type Scopes ProjectsLocationsFunctionsGetIAMPolicy =
             '["https://www.googleapis.com/auth/cloud-platform"]
        requestClient
          ProjectsLocationsFunctionsGetIAMPolicy'{..}
          = go _plfgipResource _plfgipXgafv
              _plfgipUploadProtocol
              _plfgipAccessToken
              _plfgipUploadType
              _plfgipCallback
              (Just AltJSON)
              cloudFunctionsService
          where go
                  = buildClient
                      (Proxy ::
                         Proxy ProjectsLocationsFunctionsGetIAMPolicyResource)
                      mempty
