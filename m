Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CF638E422
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 May 2021 12:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232445AbhEXKh6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 May 2021 06:37:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:8264 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232603AbhEXKh4 (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 May 2021 06:37:56 -0400
IronPort-SDR: 2YUSrwGKz2Qt9HFXA5wjpQ2CfNWB6PUF6Vrpb1EHhLR0M0fy5fhtKOIIC+su6emtr5mWw/YxCY
 N1NU8Ni6c9dQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9993"; a="223057873"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="223057873"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 03:36:27 -0700
IronPort-SDR: bUTm0ZkCDdKKkBd1xuaa8TCydnz1buWplu9kjc6oncl1A9ylttEw5LyJ3HP0d/WgvffwoUAMg8
 xzsmcTV7ozFw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="442765974"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2021 03:36:25 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ll7wc-00EIUC-Ih; Mon, 24 May 2021 13:36:22 +0300
Date:   Mon, 24 May 2021 13:36:22 +0300
From:   "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>
To:     "Sanil, Shruthi" <shruthi.sanil@intel.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kris.pan@linux.intel.com" <kris.pan@linux.intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Thokala, Srikanth" <srikanth.thokala@intel.com>,
        "Raja Subramanian, Lakshmi Bai" 
        <lakshmi.bai.raja.subramanian@intel.com>,
        "Sangannavar, Mallikarjunappa" 
        <mallikarjunappa.sangannavar@intel.com>
Subject: Re: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
Message-ID: <YKuBppIuUHqkiMg4@smile.fi.intel.com>
References: <20210517174953.19404-1-shruthi.sanil@intel.com>
 <BYAPR11MB312848D2D369C78BD2E969F0F1269@BYAPR11MB3128.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB312848D2D369C78BD2E969F0F1269@BYAPR11MB3128.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, May 24, 2021 at 06:06:35AM +0000, Sanil, Shruthi wrote:
> Hi Roeck,
> 
> I have addressed your review comments in the v2 version of this patch series.
> Could you please review?
> 
> If no comments, can I get an Acked-by tag?
> Thanks!

First of all, do not top post!

> > From: Sanil, Shruthi <shruthi.sanil@intel.com>
> > Sent: Monday, May 17, 2021 11:20 PM

AFAICS Guenter had reviewed (as you put his tags into commits). It means that
maintainer will pickup patches when they feel it's a good time.

> > The series of patches include the below bug fixes in the Intel Keem Bay
> > watchdog timer driver:

-- 
With Best Regards,
Andy Shevchenko


