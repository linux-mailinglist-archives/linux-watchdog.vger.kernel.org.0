Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DF11BDCB3
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Apr 2020 14:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgD2MwG (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Apr 2020 08:52:06 -0400
Received: from mga09.intel.com ([134.134.136.24]:25045 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgD2MwF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Apr 2020 08:52:05 -0400
IronPort-SDR: Wmhk3jsCsvoC6Z3/7SNjhmpPS5r340ziCuvzcwNZliu5MqaCTcyG24VXaE6gDoy+SOq0s+i1lI
 IB7nztwoP6jw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 05:52:04 -0700
IronPort-SDR: iorrW9uinQQLgZ3jMTcDE4CwtW/fP8p8ODYzeuGnvWB09QfLQC2sW/R9h91q7ig8VKPY2q4znR
 Xsk/jxy/WH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="367795695"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001.fm.intel.com with SMTP; 29 Apr 2020 05:52:01 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 29 Apr 2020 15:52:00 +0300
Date:   Wed, 29 Apr 2020 15:52:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO: fix link error
Message-ID: <20200429125200.GO487496@lahna.fi.intel.com>
References: <20200428212959.2993304-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428212959.2993304-1-arnd@arndb.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 28, 2020 at 11:29:11PM +0200, Arnd Bergmann wrote:
> When the MFD driver is a loadable module, the watchdog driver fails
> to get linked into the kernel:
> 
> drivers/watchdog/iTCO_wdt.o: In function `update_no_reboot_bit_pmc':
> iTCO_wdt.c:(.text+0x54f): undefined reference to `intel_pmc_gcr_update'
> 
> The code is written to support operation without the MFD driver, so
> add a Kconfig dependency that allows this, while disallowing the watchdog
> to be built-in when the MFD driver is a module.
> 
> Fixes: 25f1ca31e230 ("platform/x86: intel_pmc_ipc: Convert to MFD")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
