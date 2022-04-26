Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 040B25100FF
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Apr 2022 16:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351749AbiDZO46 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Apr 2022 10:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347212AbiDZO45 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Apr 2022 10:56:57 -0400
Received: from chinatelecom.cn (prt-mail.chinatelecom.cn [42.123.76.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8ADC262111;
        Tue, 26 Apr 2022 07:53:44 -0700 (PDT)
HMM_SOURCE_IP: 172.18.0.48:49914.31750849
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38 (unknown [172.18.0.48])
        by chinatelecom.cn (HERMES) with SMTP id B7D8F28008B;
        Tue, 26 Apr 2022 22:53:37 +0800 (CST)
X-189-SAVE-TO-SEND: +liuxp11@chinatelecom.cn
Received: from  ([172.18.0.48])
        by app0024 with ESMTP id 2f49a4b11dc54529ab945bd273b1aea4 for wim@linux-watchdog.org;
        Tue, 26 Apr 2022 22:53:39 CST
X-Transaction-ID: 2f49a4b11dc54529ab945bd273b1aea4
X-Real-From: liuxp11@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
Sender: liuxp11@chinatelecom.cn
From:   Liu Xinpeng <liuxp11@chinatelecom.cn>
To:     wim@linux-watchdog.org, linux@roeck-us.net, tzungbi@kernel.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liu Xinpeng <liuxp11@chinatelecom.cn>
Subject: [PATCH v8 0/3] Some impovements about acpi hardware watchdog
Date:   Tue, 26 Apr 2022 22:53:27 +0800
Message-Id: <1650984810-6247-1-git-send-email-liuxp11@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Changelog:
v1->v2 Update the commit messages

v2->v3 - Add the context about why using watchdog_timeout_invalid.
       - Using SET_NOIRQ_SYSTEM_SLEEP_PM_OPS reduces redundant code for
       iTCO watchdog.

v3->v4 - For patch 1, update commit message, rename WDAT_TIMEOUT_MIN
       to WDAT_MIN_TIMEOUT, keeps consistent with WDAT_DEFAULT_TIMEOUT.
       - For patch 4, iTCO_wdt_suspend_noirq and iTCO_wdt_resume_noirq
       are possible unused, so keep "ifdef CONFIG_PM_SLEEP ... #endif".

v4->v5 Split iTCO_wdt's commit from this patchset.

v5->v6 For patch 1, drop "Context: " and to change "existed" in the
       subject to "existing".

v6->v7 Rename "watchdog: wdat_wdg" in subject to "watchdog: wdat_wdt".

v7->v8 Set min_timeout to 1 without using a define.

Liu Xinpeng (3):
  watchdog: wdat_wdt: Using the existing function to check parameter
    timeout
  watchdog: wdat_wdt: Stop watchdog when rebooting the system
  watchdog: wdat_wdt: Stop watchdog when uninstalling module

 drivers/watchdog/wdat_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.23.0

