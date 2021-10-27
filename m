Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F31743D620
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 23:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhJ0WAL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 18:00:11 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:37646 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbhJ0WAK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 18:00:10 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 9EE6A409E9; Wed, 27 Oct 2021 22:33:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 9EE6A409E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1635366813;
        bh=i7vw1DeC1dV9br9SfoKoWwhahBnrrOzZLLw71QTFADM=;
        h=Date:From:To:Cc:Subject:From;
        b=CHfXuxVBTN7iWlE4JZgzv8dSS1VpNmRBZeYZS33AgYcY13xiP/MOc5GDAD7De17rU
         m0EqPLrwzVfAaiTI9hEqiSQa74BHkTVbHqvZDU21ZSCe6jdvrXAAAyq9t4o+9qgqdB
         mXLVQrxdBREzBs7J7OM05FqHiF6Ly4kVQ+EeGidk=
Date:   Wed, 27 Oct 2021 22:33:33 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jamie Iles <quic_jiles@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Walter Stoll <walter.stoll@duagon.com>
Subject: [GIT PULL REQUEST] watchdog - v5.15-rc7 fixes
Message-ID: <20211027203333.GA4663@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog fixes for v5.15-rc7.
I overlooked Guenters request to sent this upstream earlier, so yes, it's a bit late in the release cycle.

This series contains:
* Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
* sbsa: only use 32-bit accessors
* sbsa: drop unneeded MODULE_ALIAS
* ixp4xx_wdt: Fix address space warning
* Fix OMAP watchdog early handling

The output from git request-pull:
----------------------------------------------------------------
The following changes since commit 519d81956ee277b4419c723adfb154603c2565ba:

  Linux 5.15-rc6 (2021-10-17 20:00:13 -1000)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.15-rc7

for you to fetch changes up to cd004d8299f1dc6cfa6a4eea8f94cb45eaedf070:

  watchdog: Fix OMAP watchdog early handling (2021-10-26 20:22:51 +0200)

----------------------------------------------------------------
linux-watchdog 5.15-rc7 tag

----------------------------------------------------------------
Guenter Roeck (2):
      Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
      watchdog: ixp4xx_wdt: Fix address space warning

Jamie Iles (1):
      watchdog: sbsa: only use 32-bit accessors

Krzysztof Kozlowski (1):
      watchdog: sbsa: drop unneeded MODULE_ALIAS

Walter Stoll (1):
      watchdog: Fix OMAP watchdog early handling

 drivers/watchdog/iTCO_wdt.c   | 12 +++---------
 drivers/watchdog/ixp4xx_wdt.c |  2 +-
 drivers/watchdog/omap_wdt.c   |  6 +++++-
 drivers/watchdog/sbsa_gwdt.c  |  5 ++---
 4 files changed, 11 insertions(+), 14 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.

