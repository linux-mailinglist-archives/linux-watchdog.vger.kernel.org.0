Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB62030071C
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 16:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbhAVPXu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Jan 2021 10:23:50 -0500
Received: from mga01.intel.com ([192.55.52.88]:20576 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729132AbhAVPXP (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Jan 2021 10:23:15 -0500
IronPort-SDR: bo6F30Q+w8Cyn75mGPVgah65NbKO6XlRZ4CKWLk7Fp12bg1YJqQrWTvvZfRErtLY0/Z3uoWElf
 EacmADWEanxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="198215106"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="198215106"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:21:26 -0800
IronPort-SDR: lFxLSFR47TuwemF6v+gXJCIZiBjbT4VUGEGrJ/iPOEpHx1+YiESNkREDQBQ4dBuvKdLBSJcvSS
 i0W2kSPF1sgQ==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="502940399"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 07:21:23 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2yGX-0093Yz-Kr; Fri, 22 Jan 2021 17:22:25 +0200
Date:   Fri, 22 Jan 2021 17:22:25 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/5] watchdog: intel_scu_watchdog: Remove driver for
 deprecated platform
Message-ID: <YArtsQSQsGdfNlBI@smile.fi.intel.com>
References: <20210122123201.40935-1-andriy.shevchenko@linux.intel.com>
 <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f3d5ad1-9f8f-4a78-6239-6cdcbeeeb95b@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jan 22, 2021 at 03:59:34PM +0100, Hans de Goede wrote:
> Hi,
> 
> What is the plan for merging this series ?
> 
> It touches files under:
> arch/x86
> drivers/watchdog
> drivers/platform/x86
> 
> It is probably best if the entire series is merged through a single
> tree. I don't expect this to cause any conflicts with current / upcoming
> changes under drivers/platform/x86, so I'm fine with this being merged
> through another tree.
> 
> Or if I can get an ack for that from the x86 and watchdog maintainers
> I can merge the entire series through the pdx86 tree.

For time being I'm collecting tags and comments.
As of today this series is independent per se, but other (later) clean up
patches may rely on this.

One strategy can be providing an immutable branch for anybody who wants it and
merge thru PDx86 or watchdog tree (I guess PDx86 is preferable because there
are more patches touching other stuff, though independently, in this matters).

-- 
With Best Regards,
Andy Shevchenko


