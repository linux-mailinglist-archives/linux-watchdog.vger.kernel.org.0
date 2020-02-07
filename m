Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4B01560D9
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Feb 2020 22:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgBGVzE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 7 Feb 2020 16:55:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:42134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727609AbgBGVzD (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 7 Feb 2020 16:55:03 -0500
Subject: Re: [GIT PULL REQUEST] watchdog - v5.6 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581112503;
        bh=g+CPKEBAOpQXuDM8RE5koOhShP0gidSvxy/DJZ2NuZ0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HYTCEI11aCa+EMMlbOAggVXiNmWpe9Ruco7LFQkSWYIp9oBgWa4g4Z0or/SixFDXy
         unXyvnN0JLVElzSBrvCtjCW3H+RApPFagf4wLZ+VmeXiDl136fh+qIS9P+gy6MxHUj
         7vbFYq1fWV+U1iMbj1dGcI+wf/DthIOAiFkdThhI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200206194737.GA12072@www.linux-watchdog.org>
References: <20200206194737.GA12072@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200206194737.GA12072@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.6-rc1
X-PR-Tracked-Commit-Id: 057b52b4b3d58f4ee5944171da50f77b00a1bb0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b34f01f76a10386f1877181e4f0631fa2733ecdc
Message-Id: <158111250350.9631.3564512779250380763.pr-tracker-bot@kernel.org>
Date:   Fri, 07 Feb 2020 21:55:03 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christophe Roullier <christophe.roullier@st.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Jack Mitchell <ml@embed.me.uk>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Vincent Prince <Vincent.PRINCE.fr@gmail.com>,
        Vladis Dronov <vdronov@redhat.com>,
        Wang@www.linux-watchdog.org,
        "Peng 1." <peng.1.wang@nokia-sbell.com>,
        "yong.liang" <yong.liang@mediatek.com>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Thu, 6 Feb 2020 20:47:37 +0100:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b34f01f76a10386f1877181e4f0631fa2733ecdc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
