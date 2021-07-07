Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8A13BF0DF
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 22:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbhGGUnE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 16:43:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232997AbhGGUnC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 16:43:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0500F61CC2;
        Wed,  7 Jul 2021 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625690422;
        bh=o8nN7Xe4iKaBZY7Z3wNOqdUUkGIoy/rbm+wsreHFW7k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=DiRE+GnAkH/b3K21Qoq28jLJVVqIyM43W/wq8AQe2tpO03s1Bd5lGaAU9qRQBVJUB
         hMyUSMCgCof+0qxk+WchalH+nF+q9czj1LH9xun1vQkP2J2B0FWzXaMEYQeZyJXsJ0
         bpZL8nH/Sq9p2h3uVpzaHNMSYx1jnFrkvnfl+EsOESakpaKbpzcpUWNMIjKb9687Mm
         CEYYUEKD5alsq9w29dBP1hKSXKdUogkbl3QLflvMVo0deTJ4qRHtcM0qGDGoPRuSAb
         EtW5M+8+D4SD2YVCuH3LZhXPMrg02L7wzE+LjTLujav2bzOjshHIp1N64AeM9COvWg
         pTE4yIN97XdRA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E64C7609BA;
        Wed,  7 Jul 2021 20:40:21 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.14 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210707151941.GA512@www.linux-watchdog.org>
References: <20210707151941.GA512@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-watchdog.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210707151941.GA512@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.14-rc1
X-PR-Tracked-Commit-Id: cf813c67d9619fd474c785698cbed543b94209dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d69294be2a363a0128f4dc0316a7a4bb29ea91f
Message-Id: <162569042193.28460.7445044160100332262.pr-tracker-bot@kernel.org>
Date:   Wed, 07 Jul 2021 20:40:21 +0000
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Curtis Klein <curtis.klein@hpe.com>,
        Daniel Palmer <daniel@0x0f.com>,
        EnricoWeigelt@www.linux-watchdog.org,
        metux IT consult <info@metux.net>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Flavio Suligoi <f.suligoi@asem.it>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jerry Hoemann <jerry.hoemann@hpe.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Junlin Yang <yangjunlin@yulong.com>,
        Liang Chen <cl@rock-chips.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rob Herring <robh@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
        Romain Perier <romain.perier@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Seiya Wang <seiya.wang@mediatek.com>,
        Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Shruthi Sanil <shruthi.sanil@intel.com>,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Stefan Eichenberger <eichest@gmail.com>,
        Tao Ren <rentao.bupt@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Wang Qing <wangqing@vivo.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Wong Vee Khee <vee.khee.wong@linux.intel.com>,
        Zou Wei <zou_wei@huawei.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The pull request you sent on Wed, 7 Jul 2021 17:19:42 +0200:

> git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.14-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d69294be2a363a0128f4dc0316a7a4bb29ea91f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
