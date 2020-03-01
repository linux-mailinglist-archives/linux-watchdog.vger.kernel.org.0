Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC953174CB1
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Mar 2020 11:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgCAKHz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 1 Mar 2020 05:07:55 -0500
Received: from 212.199.177.27.static.012.net.il ([212.199.177.27]:38437 "EHLO
        herzl.nuvoton.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725768AbgCAKHz (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 1 Mar 2020 05:07:55 -0500
X-Greylist: delayed 1569 seconds by postgrey-1.27 at vger.kernel.org; Sun, 01 Mar 2020 05:07:51 EST
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
        by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 0219eg7I028745;
        Sun, 1 Mar 2020 11:40:42 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id B51436032E; Sun,  1 Mar 2020 11:40:42 +0200 (IST)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, joel@jms.id.au, avifishman70@gmail.com,
        tali.perry1@gmail.com, yuenn@google.com, benjaminfair@google.com
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/4] watchdog: npcm: support new capabilities
Date:   Sun,  1 Mar 2020 11:40:36 +0200
Message-Id: <20200301094040.123189-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch set adds last reset bootstatus and restart priority
support in watchdog the Nuvoton NPCM Baseboard Management
Controller (BMC).

The NPCM watchdog driver tested on NPCM750 evaluation board.

Tomer Maimon (4):
  dt-binding: watchdog: add restart priority documentation
  watchdog: npcm: add restart priority support
  dt-binding: watchdog: add bootstatus reset type documentation
  watchdog: npcm: sets card ext1 and ext2 bootstatus during probe

 .../bindings/watchdog/nuvoton,npcm-wdt.txt    |  32 ++++
 drivers/watchdog/npcm_wdt.c                   | 138 ++++++++++++++++--
 2 files changed, 157 insertions(+), 13 deletions(-)

-- 
2.22.0

