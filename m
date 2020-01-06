Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45FC131B1F
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Jan 2020 23:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbgAFWPE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Jan 2020 17:15:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:45038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbgAFWPD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Jan 2020 17:15:03 -0500
Subject: Re: [GIT PULL REQUEST] watchdog - v5.5 Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578348903;
        bh=TnEaDztOveaVafNetBAdDi2KyjKQIqroNQxDV4UbRoo=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jmctnd85I6wo4oIeuHr2illemr9+drW+Aczpn5gFOqoZrys2uFgGBrITACl4699Vg
         ziNXOha5U5hU7r2NvZfsS5Jjdt1KRiMnbMZabPHgBHPC2RO7hRgo6BVKLEvLBrazpz
         1OfRGYpAVZs9bOkWQPXaZg93+aNCJkmQVdPIm7WY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200106191234.GA1443@www.linux-watchdog.org>
References: <20200106191234.GA1443@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200106191234.GA1443@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.5-fixes
X-PR-Tracked-Commit-Id: dcbce5fbcc69bf2553f650004aad44bf390eca73
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: baf4dc829574ed9dd8ba33cda0536a50f28937de
Message-Id: <157834890321.24185.18184775319609247372.pr-tracker-bot@kernel.org>
Date:   Mon, 06 Jan 2020 22:15:03 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andreas Kemnade <andreas@kemnade.info>,
        David Engraf <david.engraf@sysgo.com>,
        Fabio Estevam <festevam@gmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Mon, 6 Jan 2020 20:12:34 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.5-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/baf4dc829574ed9dd8ba33cda0536a50f28937de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
