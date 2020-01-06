Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4191B131901
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 21:07:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgAFUHS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jan 2020 15:07:18 -0500
Received: from www.linux-watchdog.org ([185.87.125.42]:45066 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgAFUHS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jan 2020 15:07:18 -0500
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jan 2020 15:07:17 EST
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id E61D74018E; Mon,  6 Jan 2020 20:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org E61D74018E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1578337954;
        bh=2VvN6Q99eRU6JAhLlTbUje/JR/J+1FCxnbH7sV88u5o=;
        h=Date:From:To:Cc:Subject:From;
        b=kKMyPh9sxv0KOnNaXRVlqG/+dCNEI5hNXbe7YzJjbQVJMfwOndhWWuUaMjkH+dB8N
         myxvauKOAz13BcyP+eGaB1VmT2duJ77VeFVfh7gmcJ1TXkoMMEWQS3fDdeIIaS+nmQ
         m9U87UQ4XDHX/sRz4KRUKHHq2WgnKCSkrQuxXCj8=
Date:   Mon, 6 Jan 2020 20:12:34 +0100
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Kemnade <andreas@kemnade.info>,
        David Engraf <david.engraf@sysgo.com>,
        Fabio Estevam <festevam@gmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [GIT PULL REQUEST] watchdog - v5.5 Fixes
Message-ID: <20200106191234.GA1443@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-12-10)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

Please pull the watchdog changes for the v5.5 release cycle.

This series contains:
* rn5t618_wdt: fix module aliases
* max77620_wdt: fix potential build errors
* imx7ulp: Fix missing conversion of imx7ulp_wdt_enable()
* orion: fix platform_get_irq() complaints
* w83627hf_wdt: Fix NCT6116D support


The output from git request-pull:
----------------------------------------------------------------
The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the git repository at:

  git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.5-fixes

for you to fetch changes up to dcbce5fbcc69bf2553f650004aad44bf390eca73:

  watchdog: orion: fix platform_get_irq() complaints (2019-12-30 15:58:29 +0100)

----------------------------------------------------------------
linux-watchdog 5.5-fixes tag

----------------------------------------------------------------
Andreas Kemnade (1):
      watchdog: rn5t618_wdt: fix module aliases

David Engraf (1):
      watchdog: max77620_wdt: fix potential build errors

Fabio Estevam (1):
      watchdog: imx7ulp: Fix missing conversion of imx7ulp_wdt_enable()

Russell King (1):
      watchdog: orion: fix platform_get_irq() complaints

Srikanth Krishnakar (1):
      watchdog: w83627hf_wdt: Fix support NCT6116D

YueHaibing (1):
      watchdog: tqmx86_wdt: Fix build error

 drivers/watchdog/Kconfig        | 2 ++
 drivers/watchdog/imx7ulp_wdt.c  | 2 +-
 drivers/watchdog/orion_wdt.c    | 4 ++--
 drivers/watchdog/rn5t618_wdt.c  | 1 +
 drivers/watchdog/w83627hf_wdt.c | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)
----------------------------------------------------------------

Kind regards,
Wim.

