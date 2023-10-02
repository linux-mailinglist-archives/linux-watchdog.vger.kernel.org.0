Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDD3F7B4C38
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Oct 2023 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbjJBHGp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Oct 2023 03:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjJBHGo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Oct 2023 03:06:44 -0400
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 02 Oct 2023 00:06:41 PDT
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CD49F
        for <linux-watchdog@vger.kernel.org>; Mon,  2 Oct 2023 00:06:41 -0700 (PDT)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202310020705368fcf151d817ce2a810
        for <linux-watchdog@vger.kernel.org>;
        Mon, 02 Oct 2023 09:05:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/IgVjBUMAeo/4uEi1m0I1ujdMkN59bp7lD5QlXFXGBc=;
 b=YjdOO2ISq/3orS9BPOGhZipAXksXDh/yvUzxC4F5Yc4BgSY0zqw8uAeJCwJ6fWIlOGQnRJ
 5njo0c0IK3uaxxqdjNAYpNx2MTzgGoAFHxK53GhWAh26KoEr/djLWwOo7SEwtXsOC+hRDRfw
 jYlhsCPVhHkf98Qd1gCIZGPaPj64c=;
From:   Jan Kiszka <jan.kiszka@siemens.com>
To:     stable@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org,
        =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
        Malin Jonsson <malin.jonsson@ericsson.com>
Subject: [PATCH 0/2] [5.15, 5.10, 5,4] watchdog: iTCO: Backport of handle_boot_enabled=0 fix
Date:   Mon,  2 Oct 2023 09:05:33 +0200
Message-Id: <cover.1696230335.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This suggests a commit (and a follow-up fix for it) from 5.16+ for stable
because it fixes the usage of watchdog.handle_boot_enabled=0 for iTCO,
closing a monitoring gap in OTA update scenarios.

These patches are applicable to and have been tested with 5.15, 5.10 and
5.4 stable heads.

Jan

Cc: Malin Jonsson <malin.jonsson@ericsson.com>

Mika Westerberg (2):
  watchdog: iTCO_wdt: No need to stop the timer in probe
  watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already
    running

 drivers/watchdog/iTCO_wdt.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

-- 
2.35.3

