Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAAF383B99
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 19:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238879AbhEQRvP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 17 May 2021 13:51:15 -0400
Received: from mga17.intel.com ([192.55.52.151]:14146 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235250AbhEQRvN (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 17 May 2021 13:51:13 -0400
IronPort-SDR: 8eDvX7gg6JIN+U5ZSBzjIaRt/t52iKpespIjGqJzETNROmMHVLXH6pQ0LYJNEOp+D96Xh+6W6J
 FP8eclb7mRmw==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180803199"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="180803199"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 10:49:57 -0700
IronPort-SDR: 7qH1GiVtVtg9y6hbGJYr5KYzRD6NpA/BcaTzgVYdL2ZavYkOqSp1QzGghGeyEBxezixeKfX5Ii
 lxhSmIKyAHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="460394012"
Received: from bspteam04.iind.intel.com ([10.106.46.142])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2021 10:49:54 -0700
From:   shruthi.sanil@intel.com
To:     wim@linux-watchdog.org, linux@roeck-us.net,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, kris.pan@linux.intel.com,
        mgross@linux.intel.com, srikanth.thokala@intel.com,
        lakshmi.bai.raja.subramanian@intel.com,
        mallikarjunappa.sangannavar@intel.com, shruthi.sanil@intel.com
Subject: [PATCH v2 0/9] Intel Keem Bay WDT bug fixes
Date:   Mon, 17 May 2021 23:19:44 +0530
Message-Id: <20210517174953.19404-1-shruthi.sanil@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Shruthi Sanil <shruthi.sanil@intel.com>

The series of patches include the below bug fixes
in the Intel Keem Bay watchdog timer driver:

Patch 1/9:
- Update WDT pre-timeout during the initialization
  The pretimeout register has a default reset value. Hence
  when a smaller WDT timeout is set which would be lesser than the
  default pretimeout, the system behaves abnormally, starts
  triggering the pretimeout interrupt even when the WDT is
  not enabled, most of the times leading to system crash.
  Hence an update in the pre-timeout is also required for the
  default timeout that is being configured.

Patch 2/9:
- Upadate WDT pretimeout for every update in timeout
  The pre-timeout value to be programmed to the register has to be
  calculated and updated for every change in the timeout value.
  Else the threshold time wouldn't be calculated to its
  corresponding timeout.

Patch 3/9:
- Update pretimeout to 0 in the TH ISR
  The pretimeout has to be updated to 0 during the ISR of the
  ThresHold interrupt. Else the TH interrupt would be triggerred for
  every tick until the timeout.

Patch 4/9:
- Clear either the TO or TH interrupt bit
  During the interrupt service routine of the TimeOut interrupt and
  the ThresHold interrupt, the respective interrupt clear bit
  have to be cleared and not both.

Patch 5/9:
- Remove timeout update in the WDT start function
  Removed set timeout from the start WDT function. There is a function
  defined to set the timeout. Hence no need to set the timeout again in
  start function as the timeout would have been already updated
  before calling the start/enable.

Patch 6/9:
- Removed timeout update in the TO ISR
  In the TO ISR removed updating the Timeout value because
  its not serving any purpose as the timer would have already expired
  and the system would be rebooting.

Patch 7/9:
- MACRO for WDT enable and disable values
  Introduced MACRO's for WDT enable and disable values for better readability

Patch 8/9:
- WDT SMC handler MACRO name update
  Updated the WDT SMC handler MACRO name to make it clear that its
  a ARM SMC handler that helps in clearing the WDT interrupt bit.

Patch 9/9:
- Typo corrections and other blank operations
  Corrected typos, aligned the tabs and added new lines
  wherever required for better readability

Changes since v1:
- Dropped a patch with the incorrect fix
  regarding the WDT suspend/resume function.

Shruthi Sanil (9):
  watchdog: keembay: Update WDT pre-timeout during the initialization
  watchdog: keembay: Upadate WDT pretimeout for every update in timeout
  watchdog: keembay: Update pretimeout to zero in the TH ISR
  watchdog: keembay: Clear either the TO or TH interrupt bit
  watchdog: keembay: Remove timeout update in the WDT start function
  watchdog: keembay: Removed timeout update in the TO ISR
  watchdog: keembay: MACRO for WDT enable and disable values
  watchdog: keembay: WDT SMC handler MACRO name update
  watchdog: keembay: Typo corrections and other blank operations

 drivers/watchdog/keembay_wdt.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)


base-commit: 88b06399c9c766c283e070b022b5ceafa4f63f19
-- 
2.17.1

