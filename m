Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73EDD242FBF
	for <lists+linux-watchdog@lfdr.de>; Wed, 12 Aug 2020 21:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgHLT6N (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 12 Aug 2020 15:58:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726526AbgHLT6M (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Aug 2020 15:58:12 -0400
Subject: Re: [GIT PULL REQUEST] watchdog - v5.9 Merge window
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597262292;
        bh=7BjRGpdNVqLiBiQlSFB7gykyIJjApbxW+W5+qA3TEls=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=zbDLRZVXizwWwdk/kIjDhhT51Nc1T+ROuYGvEmGWQtpftThf0N1gvGi/ZKMxSe/hl
         yTr4yi/qj9lEDLfdP9L1kZ9X8AbaHYYRiTVgEb4cekFLW4khP2iTHjw7DiRLgVfbZ8
         v3qicqOxrI8t0Rn7+gTi3CohROZb49tHEqo4PE3g=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200812113903.GA14481@www.linux-watchdog.org>
References: <20200812113903.GA14481@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200812113903.GA14481@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.9-rc1
X-PR-Tracked-Commit-Id: d5b29c2c5ba2bd5bbdb5b744659984185d17d079
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4586039427fab2b8c4edd49c73002e13e04315cf
Message-Id: <159726229223.30367.3082350104066434774.pr-tracker-bot@kernel.org>
Date:   Wed, 12 Aug 2020 19:58:12 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Bumsik Kim <kbumsik@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Krzysztof Sobota <krzysztof.sobota@nokia.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Martin Wu <wuyan@allwinnertech.com>,
        Michael Shych <michaelsh@mellanox.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tero Kristo <t-kristo@ti.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Timothy Myers <timothy.myers@adtran.com>,
        Wang Qing <wangqing@vivo.com>, Woody Lin <woodylin@google.com>,
        Xu Wang <vulab@iscas.ac.cn>
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 12 Aug 2020 13:39:03 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.9-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4586039427fab2b8c4edd49c73002e13e04315cf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
