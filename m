Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBFF1AE5A3
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 Apr 2020 21:15:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgDQTPF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 Apr 2020 15:15:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728151AbgDQTPF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 Apr 2020 15:15:05 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.7-rc2 Fixes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587150904;
        bh=7R1rzHtiDxoGO20dRIbUXNsjrbIUZWB+0zMyRMWn/4A=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=h6D0MO4x/ertCcKRZ9IYBcEJ8v58DG1fP4+50W18nlSZvxtJwLfGouLudsfue6prT
         lusuVVSvmLptt6XM7dXouFB67kJFdgSuEjW96v1oK5IMh5GWW1JCPEAB7XXFOU0ytX
         7l5NxA+SnY6I9S1uF8/6K5zkv4c2QSSFIvhQojCk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200417144207.GA29911@www.linux-watchdog.org>
References: <20200417144207.GA29911@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200417144207.GA29911@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git
 tags/linux-watchdog-5.7-rc2
X-PR-Tracked-Commit-Id: ea104a9e4d3e9ebc26fb78dac35585b142ee288b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1634615dc14d258f3c5695338db26d5f115dabc7
Message-Id: <158715090464.7925.12968125380490341841.pr-tracker-bot@kernel.org>
Date:   Fri, 17 Apr 2020 19:15:04 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Walle <michael@walle.cc>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Fri, 17 Apr 2020 16:42:07 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.7-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1634615dc14d258f3c5695338db26d5f115dabc7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
