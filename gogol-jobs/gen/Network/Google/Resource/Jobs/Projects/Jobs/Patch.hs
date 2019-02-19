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
-- Module      : Network.Google.Resource.Jobs.Projects.Jobs.Patch
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Updates specified job. Typically, updated contents become visible in
-- search results within 10 seconds, but it may take up to 5 minutes.
--
-- /See:/ <https://cloud.google.com/talent-solution/job-search/docs/ Cloud Talent Solution API Reference> for @jobs.projects.jobs.patch@.
module Network.Google.Resource.Jobs.Projects.Jobs.Patch
    (
    -- * REST Resource
      ProjectsJobsPatchResource

    -- * Creating a Request
    , projectsJobsPatch
    , ProjectsJobsPatch

    -- * Request Lenses
    , pjpXgafv
    , pjpUploadProtocol
    , pjpAccessToken
    , pjpUploadType
    , pjpPayload
    , pjpName
    , pjpCallback
    ) where

import           Network.Google.Jobs.Types
import           Network.Google.Prelude

-- | A resource alias for @jobs.projects.jobs.patch@ method which the
-- 'ProjectsJobsPatch' request conforms to.
type ProjectsJobsPatchResource =
     "v3p1beta1" :>
       Capture "name" Text :>
         QueryParam "$.xgafv" Xgafv :>
           QueryParam "upload_protocol" Text :>
             QueryParam "access_token" Text :>
               QueryParam "uploadType" Text :>
                 QueryParam "callback" Text :>
                   QueryParam "alt" AltJSON :>
                     ReqBody '[JSON] UpdateJobRequest :> Patch '[JSON] Job

-- | Updates specified job. Typically, updated contents become visible in
-- search results within 10 seconds, but it may take up to 5 minutes.
--
-- /See:/ 'projectsJobsPatch' smart constructor.
data ProjectsJobsPatch =
  ProjectsJobsPatch'
    { _pjpXgafv          :: !(Maybe Xgafv)
    , _pjpUploadProtocol :: !(Maybe Text)
    , _pjpAccessToken    :: !(Maybe Text)
    , _pjpUploadType     :: !(Maybe Text)
    , _pjpPayload        :: !UpdateJobRequest
    , _pjpName           :: !Text
    , _pjpCallback       :: !(Maybe Text)
    }
  deriving (Eq, Show, Data, Typeable, Generic)

-- | Creates a value of 'ProjectsJobsPatch' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'pjpXgafv'
--
-- * 'pjpUploadProtocol'
--
-- * 'pjpAccessToken'
--
-- * 'pjpUploadType'
--
-- * 'pjpPayload'
--
-- * 'pjpName'
--
-- * 'pjpCallback'
projectsJobsPatch
    :: UpdateJobRequest -- ^ 'pjpPayload'
    -> Text -- ^ 'pjpName'
    -> ProjectsJobsPatch
projectsJobsPatch pPjpPayload_ pPjpName_ =
  ProjectsJobsPatch'
    { _pjpXgafv = Nothing
    , _pjpUploadProtocol = Nothing
    , _pjpAccessToken = Nothing
    , _pjpUploadType = Nothing
    , _pjpPayload = pPjpPayload_
    , _pjpName = pPjpName_
    , _pjpCallback = Nothing
    }

-- | V1 error format.
pjpXgafv :: Lens' ProjectsJobsPatch (Maybe Xgafv)
pjpXgafv = lens _pjpXgafv (\ s a -> s{_pjpXgafv = a})

-- | Upload protocol for media (e.g. \"raw\", \"multipart\").
pjpUploadProtocol :: Lens' ProjectsJobsPatch (Maybe Text)
pjpUploadProtocol
  = lens _pjpUploadProtocol
      (\ s a -> s{_pjpUploadProtocol = a})

-- | OAuth access token.
pjpAccessToken :: Lens' ProjectsJobsPatch (Maybe Text)
pjpAccessToken
  = lens _pjpAccessToken
      (\ s a -> s{_pjpAccessToken = a})

-- | Legacy upload protocol for media (e.g. \"media\", \"multipart\").
pjpUploadType :: Lens' ProjectsJobsPatch (Maybe Text)
pjpUploadType
  = lens _pjpUploadType
      (\ s a -> s{_pjpUploadType = a})

-- | Multipart request metadata.
pjpPayload :: Lens' ProjectsJobsPatch UpdateJobRequest
pjpPayload
  = lens _pjpPayload (\ s a -> s{_pjpPayload = a})

-- | Required during job update. The resource name for the job. This is
-- generated by the service when a job is created. The format is
-- \"projects\/{project_id}\/jobs\/{job_id}\", for example,
-- \"projects\/api-test-project\/jobs\/1234\". Use of this field in job
-- queries and API calls is preferred over the use of requisition_id since
-- this value is unique.
pjpName :: Lens' ProjectsJobsPatch Text
pjpName = lens _pjpName (\ s a -> s{_pjpName = a})

-- | JSONP
pjpCallback :: Lens' ProjectsJobsPatch (Maybe Text)
pjpCallback
  = lens _pjpCallback (\ s a -> s{_pjpCallback = a})

instance GoogleRequest ProjectsJobsPatch where
        type Rs ProjectsJobsPatch = Job
        type Scopes ProjectsJobsPatch =
             '["https://www.googleapis.com/auth/cloud-platform",
               "https://www.googleapis.com/auth/jobs"]
        requestClient ProjectsJobsPatch'{..}
          = go _pjpName _pjpXgafv _pjpUploadProtocol
              _pjpAccessToken
              _pjpUploadType
              _pjpCallback
              (Just AltJSON)
              _pjpPayload
              jobsService
          where go
                  = buildClient
                      (Proxy :: Proxy ProjectsJobsPatchResource)
                      mempty
