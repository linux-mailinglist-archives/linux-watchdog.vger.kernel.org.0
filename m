Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F4BC4984
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Oct 2019 10:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbfJBIbp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Oct 2019 04:31:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:57301 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbfJBIbp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Oct 2019 04:31:45 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 01:31:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,573,1559545200"; 
   d="scan'208";a="203525819"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 02 Oct 2019 01:31:42 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iFa2v-00070v-44; Wed, 02 Oct 2019 11:31:41 +0300
Date:   Wed, 2 Oct 2019 11:31:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     razvan becheriu <razvan.becheriu@gmail.com>
Cc:     Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
Message-ID: <20191002083141.GA32742@smile.fi.intel.com>
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
 <CAJAoKi_c2XRi_tdJcc3MMS1=9d4WH_Tq9EmH30-GyXcPoJhXGA@mail.gmail.com>
 <CAJAoKi_C85WDxu_XppFhn7BjZC1GznqQrPFKW9W2wEpHzz4wPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJAoKi_C85WDxu_XppFhn7BjZC1GznqQrPFKW9W2wEpHzz4wPw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 02, 2019 at 09:11:33AM +0300, razvan becheriu wrote:

> regarding the test for the WATCHDOG_NOWAYOUT patch:
> 
> ```
> Tested-by: Razvan Becheriu <razvan.becheriu@gmail.com>
> The patch works.
> By configuring the CONFIG_WATCHDOG_NOWAYOUT in the kernel and stopping
> the watchdog.service, the board reboots.
> Previously, the watchdog.service was able to disable the watchdog
> counter, and no reboot was performed.
> ```

Thank you!

Now you can find it in archives [1].

[1]: https://lore.kernel.org/linux-watchdog/CAJAoKi_C85WDxu_XppFhn7BjZC1GznqQrPFKW9W2wEpHzz4wPw@mail.gmail.com/T/#t

For the future, please avoid top postings.

-- 
With Best Regards,
Andy Shevchenko


