Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D505350D09
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Apr 2021 05:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhDAD2W (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Mar 2021 23:28:22 -0400
Received: from mga09.intel.com ([134.134.136.24]:17485 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhDAD1w (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Mar 2021 23:27:52 -0400
IronPort-SDR: VhZU4aW11Lr1B5MR52mc+8OZDS0agSN+LHyMgn6h+4Nboy1hy5H94fGXF6VLKak8I8DqSAYZWF
 hI/1n0xr2yQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="192243119"
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="192243119"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 20:27:50 -0700
IronPort-SDR: 8jFRhq8W+mfpk4hHL63zW3fuMylS46MdXbFz3Q+kJRNG7ONuSbR+9QqiOK8ZdwEGJUOOKgwxIJ
 E/+C0SphslYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,295,1610438400"; 
   d="scan'208";a="439050840"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP; 31 Mar 2021 20:27:49 -0700
Received: from glass.png.intel.com (glass.png.intel.com [10.158.65.59])
        by linux.intel.com (Postfix) with ESMTP id B91985808ED;
        Wed, 31 Mar 2021 20:27:47 -0700 (PDT)
From:   Wong Vee Khee <vee.khee.wong@linux.intel.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wong Vee Khee <vee.khee.wong@intel.com>,
        Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Subject: [PATCH 1/1] watchdog: Fix a typo in Kconfig
Date:   Thu,  1 Apr 2021 11:32:09 +0800
Message-Id: <20210401033209.9929-1-vee.khee.wong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

s/thershold/threshold

Cc: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
Signed-off-by: Wong Vee Khee <vee.khee.wong@linux.intel.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 0470dc15c085..aa382e5edfef 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2111,7 +2111,7 @@ config KEEMBAY_WATCHDOG
 	 This option enable support for an In-secure watchdog timer driver for
 	 Intel Keem Bay SoC. This WDT has a 32 bit timer and decrements in every
 	 count unit. An interrupt will be triggered, when the count crosses
-	 the thershold configured in the register.
+	 the threshold configured in the register.
 
 	 To compile this driver as a module, choose M here: the
 	 module will be called keembay_wdt.
-- 
2.25.1

