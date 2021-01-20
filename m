Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6335C2FD5BB
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 17:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403959AbhATQb5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 11:31:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:46056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404018AbhATQ2b (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 11:28:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1519F22CE3;
        Wed, 20 Jan 2021 16:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611160071;
        bh=0Ulbs64MS7lh0+ElYG8E9KKDAsaHstVigm5RKDUpAXs=;
        h=From:To:Cc:Subject:Date:From;
        b=TOOrb/7BQ6ON4uiOXU3w+V3XTGk9BnOZqWGkijteYrm4bMUtElVH5pMrt2Y81wxk5
         K2aEo3Gzf6f/0Q4D2U05QNv+CMOqrc0zxBzkPyum0H6+ct6HNlItbz064K/1EyIW33
         IkQVfkIL55k0wl5kyrPvzwd6wk8ByuWmjMpk3J/OLM0eAIEmVDZBQOS/bNXvLLs3Vn
         Yfs4JZbH9jezAoScsg8QpnO0yrDeLlrjShx/e5PPCCt4hgnVzviN/V/x8vzkVTKCWL
         k2iqRJoDT6HJfmyNPakKNxxTfJmYtJQc3w1hoK21NPh+OR40g/S7bzZGm/B0oHm1GI
         v4UYheEZUCf8w==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/5] watchdog: remove obsolete drivers
Date:   Wed, 20 Jan 2021 17:27:40 +0100
Message-Id: <20210120162745.61268-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A few Arm platforms are getting removed in v5.12, this removes
the corresponding watchdog drivers.

Link: https://lore.kernel.org/linux-arm-kernel/20210120124812.2800027-1-arnd@kernel.org/T/


Arnd Bergmann (5):
  watchdog: remove sirf prima driver
  watchdog: remove sirf atlas driver
  watchdog: remove zte zx driver
  watchdog: remove tango driver
  watchdog: remove coh901 driver

 .../bindings/watchdog/sirfsoc_wdt.txt         |  18 -
 .../watchdog/stericsson-coh901327.txt         |  19 -
 .../bindings/watchdog/zte,zx2967-wdt.txt      |  32 --
 drivers/watchdog/Kconfig                      |  52 ---
 drivers/watchdog/Makefile                     |   5 -
 drivers/watchdog/atlas7_wdt.c                 | 221 ----------
 drivers/watchdog/coh901327_wdt.c              | 408 ------------------
 drivers/watchdog/sirfsoc_wdt.c                | 216 ----------
 drivers/watchdog/tangox_wdt.c                 | 209 ---------
 drivers/watchdog/zx2967_wdt.c                 | 279 ------------
 10 files changed, 1459 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/sirfsoc_wdt.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/stericsson-coh901327.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
 delete mode 100644 drivers/watchdog/atlas7_wdt.c
 delete mode 100644 drivers/watchdog/coh901327_wdt.c
 delete mode 100644 drivers/watchdog/sirfsoc_wdt.c
 delete mode 100644 drivers/watchdog/tangox_wdt.c
 delete mode 100644 drivers/watchdog/zx2967_wdt.c

-- 
2.29.2

