Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16501321EE4
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Feb 2021 19:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbhBVSMp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Feb 2021 13:12:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:37344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230416AbhBVSMg (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Feb 2021 13:12:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A28164E24;
        Mon, 22 Feb 2021 18:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614017515;
        bh=hEtCWTORUcGG+DuQzTGbfMBKc3AI4DjgkL2BEIGW27k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rI+HU7E6D03dpIOrLr98EJNHusW0fKlUKvdDHzq6JM88VQCO+TL5EWMjnGDdb/R+8
         PVsWQZSAetDMP6mK3BBOF7wtAp4tvbKp7AWCde4YupXTUMwyWz59NFhYNU4igAUN/8
         ujeKbMWjifFFUvtCGhcBaq6D/IZShlBkLjoQFyFtjmZnZC0Am8N+cvRX65Py4HhX68
         Sq/Ty4UWMLFLzb2IxhJ3TjV3a39q4ORpNKkOHp/CGtXBRFQ42/gu9p7JmeUyWqi1Hl
         ++qUmR9uUZZktXl0BZGq3bZPBqNgdx0lTz00so2a74iN7Hmi6TQza1QbJL79Z6MYVd
         /dc5fmsjScv+Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F27B60982;
        Mon, 22 Feb 2021 18:11:55 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.12 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210215154727.GA30814@www.linux-watchdog.org>
References: <20210215154727.GA30814@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210215154727.GA30814@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.12-rc1
X-PR-Tracked-Commit-Id: a4f3407c41605d14f09e490045d0609990cd5d94
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: deb8d159a0a69bd19a328c700bb42b802cbcf7b5
Message-Id: <161401751533.943.6835457300660521255.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Feb 2021 18:11:55 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Crystal Guo <crystal.guo@mediatek.com>,
        "freddy.hsin" <freddy.hsin@mediatek.com>,
        Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>,
        Johan Jonker <jbx6244@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Tian Tao <tiantao6@hisilicon.com>, Tom Rix <trix@redhat.com>,
        Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhao Qiang <qiang.zhao@nxp.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Mon, 15 Feb 2021 16:47:27 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.12-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/deb8d159a0a69bd19a328c700bb42b802cbcf7b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
