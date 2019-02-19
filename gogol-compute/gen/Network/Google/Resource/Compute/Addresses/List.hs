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
-- Module      : Network.Google.Resource.Compute.Addresses.List
-- Copyright   : (c) 2015-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves a list of addresses contained within the specified region.
--
-- /See:/ <https://developers.google.com/compute/docs/reference/latest/ Compute Engine API Reference> for @compute.addresses.list@.
module Network.Google.Resource.Compute.Addresses.List
    (
    -- * REST Resource
      AddressesListResource

    -- * Creating a Request
    , addressesList
    , AddressesList

    -- * Request Lenses
    , alOrderBy
    , alProject
    , alFilter
    , alRegion
    , alPageToken
    , alMaxResults
    ) where

import           Network.Google.Compute.Types
import           Network.Google.Prelude

-- | A resource alias for @compute.addresses.list@ method which the
-- 'AddressesList' request conforms to.
type AddressesListResource =
     "compute" :>
       "v1" :>
         "projects" :>
           Capture "project" Text :>
             "regions" :>
               Capture "region" Text :>
                 "addresses" :>
                   QueryParam "orderBy" Text :>
                     QueryParam "filter" Text :>
                       QueryParam "pageToken" Text :>
                         QueryParam "maxResults" (Textual Word32) :>
                           QueryParam "alt" AltJSON :> Get '[JSON] AddressList

-- | Retrieves a list of addresses contained within the specified region.
--
-- /See:/ 'addressesList' smart constructor.
data AddressesList =
  AddressesList'
    { _alOrderBy    :: !(Maybe Text)
    , _alProject    :: !Text
    , _alFilter     :: !(Maybe Text)
    , _alRegion     :: !Text
    , _alPageToken  :: !(Maybe Text)
    , _alMaxResults :: !(Textual Word32)
    }
  deriving (Eq, Show, Data, Typeable, Generic)

-- | Creates a value of 'AddressesList' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'alOrderBy'
--
-- * 'alProject'
--
-- * 'alFilter'
--
-- * 'alRegion'
--
-- * 'alPageToken'
--
-- * 'alMaxResults'
addressesList
    :: Text -- ^ 'alProject'
    -> Text -- ^ 'alRegion'
    -> AddressesList
addressesList pAlProject_ pAlRegion_ =
  AddressesList'
    { _alOrderBy = Nothing
    , _alProject = pAlProject_
    , _alFilter = Nothing
    , _alRegion = pAlRegion_
    , _alPageToken = Nothing
    , _alMaxResults = 500
    }

-- | Sorts list results by a certain order. By default, results are returned
-- in alphanumerical order based on the resource name. You can also sort
-- results in descending order based on the creation timestamp using
-- orderBy=\"creationTimestamp desc\". This sorts results based on the
-- creationTimestamp field in reverse chronological order (newest result
-- first). Use this to sort resources like operations so that the newest
-- operation is returned first. Currently, only sorting by name or
-- creationTimestamp desc is supported.
alOrderBy :: Lens' AddressesList (Maybe Text)
alOrderBy
  = lens _alOrderBy (\ s a -> s{_alOrderBy = a})

-- | Project ID for this request.
alProject :: Lens' AddressesList Text
alProject
  = lens _alProject (\ s a -> s{_alProject = a})

-- | A filter expression that filters resources listed in the response. The
-- expression must specify the field name, a comparison operator, and the
-- value that you want to use for filtering. The value must be a string, a
-- number, or a boolean. The comparison operator must be either =, !=, >,
-- or \<. For example, if you are filtering Compute Engine instances, you
-- can exclude instances named example-instance by specifying name !=
-- example-instance. You can also filter nested fields. For example, you
-- could specify scheduling.automaticRestart = false to include instances
-- only if they are not scheduled for automatic restarts. You can use
-- filtering on nested fields to filter based on resource labels. To filter
-- on multiple expressions, provide each separate expression within
-- parentheses. For example, (scheduling.automaticRestart = true)
-- (cpuPlatform = \"Intel Skylake\"). By default, each expression is an AND
-- expression. However, you can include AND and OR expressions explicitly.
-- For example, (cpuPlatform = \"Intel Skylake\") OR (cpuPlatform = \"Intel
-- Broadwell\") AND (scheduling.automaticRestart = true).
alFilter :: Lens' AddressesList (Maybe Text)
alFilter = lens _alFilter (\ s a -> s{_alFilter = a})

-- | Name of the region for this request.
alRegion :: Lens' AddressesList Text
alRegion = lens _alRegion (\ s a -> s{_alRegion = a})

-- | Specifies a page token to use. Set pageToken to the nextPageToken
-- returned by a previous list request to get the next page of results.
alPageToken :: Lens' AddressesList (Maybe Text)
alPageToken
  = lens _alPageToken (\ s a -> s{_alPageToken = a})

-- | The maximum number of results per page that should be returned. If the
-- number of available results is larger than maxResults, Compute Engine
-- returns a nextPageToken that can be used to get the next page of results
-- in subsequent list requests. Acceptable values are 0 to 500, inclusive.
-- (Default: 500)
alMaxResults :: Lens' AddressesList Word32
alMaxResults
  = lens _alMaxResults (\ s a -> s{_alMaxResults = a})
      . _Coerce

instance GoogleRequest AddressesList where
        type Rs AddressesList = AddressList
        type Scopes AddressesList =
             '["https://www.googleapis.com/auth/cloud-platform",
               "https://www.googleapis.com/auth/compute",
               "https://www.googleapis.com/auth/compute.readonly"]
        requestClient AddressesList'{..}
          = go _alProject _alRegion _alOrderBy _alFilter
              _alPageToken
              (Just _alMaxResults)
              (Just AltJSON)
              computeService
          where go
                  = buildClient (Proxy :: Proxy AddressesListResource)
                      mempty
