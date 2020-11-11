Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25682AE620
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Nov 2020 03:08:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731657AbgKKCIt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 Nov 2020 21:08:49 -0500
Received: from mga12.intel.com ([192.55.52.136]:46776 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgKKCIs (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 Nov 2020 21:08:48 -0500
IronPort-SDR: ty8HGBfk0xuiDI11xtzr7+7AGC5zWrN69WOVkYvQjvrHgOiW28g5E4zm0Zw2CIMQ/e9bCvaNWn
 xvIrpFsWS9ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="149357074"
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="149357074"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 18:08:48 -0800
IronPort-SDR: afiVCxfiWvl7D1+uUbpRHYKGqLvSJgE1217vKWUrAdSmlH0izSyRmdOFVheO6KR+8XA84TXozv
 i8ALRfVy2anA==
X-IronPort-AV: E=Sophos;i="5.77,468,1596524400"; 
   d="scan'208";a="308287645"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2020 18:08:48 -0800
Received: from localhost (mtg-dev.jf.intel.com [10.54.74.10])
        by smtp.ostc.intel.com (Postfix) with ESMTP id 1F3A56363;
        Tue, 10 Nov 2020 18:08:48 -0800 (PST)
Date:   Tue, 10 Nov 2020 18:08:48 -0800
From:   mark gross <mgross@linux.intel.com>
To:     vijayakannan.ayyathurai@intel.com
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        andriy.shevchenko@linux.intel.com,
        wan.ahmad.zainie.wan.mohamad@intel.com,
        lakshmi.bai.raja.subramanian@intel.com
Subject: Re: [PATCH v2 0/2] Add drivers for Intel Keem Bay SoC watchdog
Message-ID: <20201111020847.GM6928@mtg-dev.jf.intel.com>
Reply-To: mgross@linux.intel.com
References: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605028524.git.vijayakannan.ayyathurai@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 11, 2020 at 01:53:06AM +0800, vijayakannan.ayyathurai@intel.com wrote:
> From: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
> 
> Hi,
> 
> This patch set adds the watchdog timer driver support for Intel Keem Bay Soc.
> 
> Patch 1 holds the driver and Patch 2 holds the Device Tree
> binding documentation.
> 
> This driver was tested on the Keem Bay evaluation module board.
> 
> Thank you,
> Vijay
> 
> Changes since v1:
>  - Fix indentation error in the dt-bindings file.
>  - Use true/false in the second arg of keembay_wdt_set_timeout_reg().
>  - Fix the watchdog start sequence.
>  - Avoid reduntant timeout register setting.
>  - Remove min usage to find actual time at keembay_wdt_set_timeout().
>  - Remove timeout configuration boundary check at
>    keembay_wdt_set_pretimeout().
>  - Use devm_watchdog_register_device() for wdt registration, which
>    eventually supports driver unload functionality as well.
> 
> Vijayakannan Ayyathurai (2):
>   watchdog: Add watchdog driver for Intel Keembay Soc
>   dt-bindings: watchdog: Add bindings for Intel Keem Bay SoC
> 
>  .../bindings/watchdog/intel,keembay-wdt.yaml  |  57 ++++
>  drivers/watchdog/Kconfig                      |  13 +
>  drivers/watchdog/Makefile                     |   1 +
>  drivers/watchdog/keembay_wdt.c                | 288 ++++++++++++++++++
>  4 files changed, 359 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/intel,keembay-wdt.yaml
>  create mode 100644 drivers/watchdog/keembay_wdt.c
> 
> 
> base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
> prerequisite-patch-id: 822987dcf4c969ef6ac70359b088af06ba39042b
> prerequisite-patch-id: 0a348762b660d0d817b8e70cc71647e83173c78c
> prerequisite-patch-id: 54c661a006c7362053cb7602448d6c77419d5cf9
> prerequisite-patch-id: d140d8534fb828778e0652fe5fcf6282e027f985
these patch-id's are not helpful to me if I want to to a test build of this
patch.  Those SHA1's are not available to others unless there is a public
non-rebasing tree I can pull from.  if there is one then you should provide the
git remot URL for that otherwise I cannot fetch those prerequisites.

Maybe it would be better to list the mailing list archive URL for each change
instead.

--mark

> -- 
> 2.17.1
> 
