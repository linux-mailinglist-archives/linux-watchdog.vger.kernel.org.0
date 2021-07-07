Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250B03BF0E0
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 Jul 2021 22:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhGGUnE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 7 Jul 2021 16:43:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233004AbhGGUnC (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 7 Jul 2021 16:43:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2992461CC6;
        Wed,  7 Jul 2021 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625690422;
        bh=o8nN7Xe4iKaBZY7Z3wNOqdUUkGIoy/rbm+wsreHFW7k=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=fbJ2JWSxydDBK6abk8IPT8p02Ue1T7yptOtXlbrzi8/LItuNApoQ8Mk6IKd4jJtiZ
         +3YTy0LsCu6rfS+YRRul3NKKERrgzUHh+Vydf2UWp8bmnHoMq3FRbug6CAkkPAqkAo
         Sk0mVaj5OoIdTPEycfW4hl4oxSKRc0Gj/IOoZ1892t3iAI7D9v5R8INag/VOmv3Rh/
         TTPJq0JkKtxB3Cy75jOaYp1R4sknmY7Tk0RJp1WVB/uI2co/otP9giaplwQPtaREea
         UkpY8NUwxeBZ7dqTm0ZwJMF7QlnGiJu3Gf8PvIaBBU8cjnuQmSSWCtpEo+E5hM8AgF
         egEOge1iP8V8g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E4D0609F6;
        Wed,  7 Jul 2021 20:40:22 +0000 (UTC)
Subject: Re: [GIT PULL REQUEST] watchdog - v5.14 Merge window
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210707151941.GA512@www.linux-watchdog.org>
References: <20210707151941.GA512@www.linux-watchdog.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210707151941.GA512@www.linux-watchdog.org>
X-PR-Tracked-Remote: git://www.linux-watchdog.org/linux-watchdog.git tags/linux-watchdog-5.14-rc1
X-PR-Tracked-Commit-Id: cf813c67d9619fd474c785698cbed543b94209dd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d69294be2a363a0128f4dc0316a7a4bb29ea91f
Message-Id: <162569042211.28701.6715633412500198288.pr-tracker-bot@kernel.org>
Date:   Wed, 07 Jul 2021 20:40:22 +0000
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
