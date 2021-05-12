Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCD037B860
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 May 2021 10:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbhELIsl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 May 2021 04:48:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:57960 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230338AbhELIsk (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 May 2021 04:48:40 -0400
IronPort-SDR: uzZ/J5O/2u7U/B9VibOUFy6GXnWLk+718gBMHOFU1FNACf5FsRlf3DDB8SJInMkR3tgqm1muXD
 S8LgsFKce5AA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179246740"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179246740"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:47:28 -0700
IronPort-SDR: IQsEYqQMi49x9kRgS8IBVb7ABTPpLXR6ze4CRWBeyZU/NThAVF9Gs490rA3kXDQhNRjZnrDYOa
 IW3w9CA01wYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="435106387"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2021 01:47:25 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH 00/10] Intel Keem Bay WDT bug fixes
Date:   Wed, 12 May 2021 14:17:14 +0530
Message-Id: <20210512084724.14634-1-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

The series of patches include the below bug fixes
in the Intel Keem Bay watchdog timer driver:

Patch 1/10:
- Update WDT pre-timeout during the initialization
  The pretimeout register has a default reset value. Hence
  when a smaller WDT timeout is set which would be lesser than the
  default pretimeout, the system behaves abnormally, starts
  triggering the pretimeout interrupt even when the WDT is
  not enabled, most of the times leading to system crash.
  Hence an update in the pre-timeout is also required for the
  default timeout that is being configured.

Patch 2/10:
- Upadate WDT pretimeout for every update in timeout
  The pre-timeout value to be programmed to the register has to be
  calculated and updated for every change in the timeout value.
  Else the threshold time wouldn't be calculated to its
  corresponding timeout.

Patch 3/10:
- Update pretimeout to 0 in the TH ISR
  The pretimeout has to be updated to 0 during the ISR of the
  ThresHold interrupt. Else the TH interrupt would be triggerred for
  every tick until the timeout.

Patch 4/10:
- Clear either the TO or TH interrupt bit
  During the interrupt service routine of the TimeOut interrupt and
  the ThresHold interrupt, the respective interrupt clear bit
  have to be cleared and not both.

Patch 5/10:
- Remove timeout update in the WDT start function
  Removed set timeout from the start WDT function. There is a function
  defined to set the timeout. Hence no need to set the timeout again in
  start function as the timeout would have been already updated
  before calling the start/enable.

Patch 6/10:
- Removed timeout update in the TO ISR
  In the TO ISR removed updating the Timeout value because
  its not serving any purpose as the timer would have already expired
  and the system would be rebooting.

Patch 7/10:
- Update the check in keembay_wdt_resume()
  Corrected the typo in the function keembay_wdt_resume, we need to
  enable the WDT if it is disabled/not active.

Patch 8/10:
- MACRO for WDT enable and disable values
  Introduced MACRO's for WDT enable and disable values for better readability

Patch 9/10:
- WDT SMC handler MACRO name update
  Updated the WDT SMC handler MACRO name to make it clear that its
  a ARM SMC handler that helps in clearing the WDT interrupt bit.

Patch 10/10:
- Typo corrections and other blank operations
  Corrected typos, aligned the tabs and added new lines
  wherever required for better readability

Shruthi Sanil (10):
  watchdog: keembay: Update WDT pre-timeout during the initialization
  watchdog: keembay: Upadate WDT pretimeout for every update in timeout
  watchdog: keembay: Update pretimeout to zero in the TH ISR
  watchdog: keembay: Clear either the TO or TH interrupt bit
  watchdog: keembay: Remove timeout update in the WDT start function
  watchdog: keembay: Removed timeout update in the TO ISR
  watchdog: keembay: Update the check in keembay_wdt_resume()
  watchdog: keembay: MACRO for WDT enable and disable values
  watchdog: keembay: WDT SMC handler MACRO name update
  watchdog: keembay: Typo corrections and other blank operations

 drivers/watchdog/keembay_wdt.c | 36 ++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 13 deletions(-)


base-commit: 88b06399c9c766c283e070b022b5ceafa4f63f19
-- 
2.17.1

