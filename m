Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EBF1EEA35
	for <lists+linux-watchdog@lfdr.de>; Thu,  4 Jun 2020 20:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730775AbgFDSZD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 4 Jun 2020 14:25:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730773AbgFDSZD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 4 Jun 2020 14:25:03 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.8 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591295103;
        bh=4GYfG4NIAtWs5zkPYaH7LAejT+acjQnuz5KG0/00Cow=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nY1WUt11VZr8ZQppkAOxUHueHNlhROnLD6Wl/Rj73j2NUGCvn2luTycQ/xo5jedgd
         Xtw5oXa3L2maHpFX6CTAFUbC3YWjIQmaxMMBeso0ACXZOALxG9k/xOIMOBSsOLy6pC
         XUManJqpykj8jBwureAoYcmL16Wg/DgSEjxxOYLw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200603104521.GA14826@www.linux-watchdog.org>
References: <20200603104521.GA14826@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200603104521.GA14826@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.8-rc1
X-PR-Tracked-Commit-Id: 072cb8b628d312f5785ffdf324286a0519aed910
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0486a39a6d6c8db78bde4d7b9c44e32dcc6050d4
Message-Id: <159129510300.18772.3554679226160374886.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Jun 2020 18:25:03 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Arnd Bergmann <arnd@arndb.de>, Bumsik Kim <kbumsik@gmail.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Evan Benn <evanbenn@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jason Yan <yanaijie@huawei.com>,
        Julius Werner <jwerner@chromium.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shyam Saini <mayhs11saini@gmail.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa@kernel.org>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 3 Jun 2020 12:45:21 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.8-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0486a39a6d6c8db78bde4d7b9c44e32dcc6050d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
