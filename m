Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A827C4EE322
	for <lists+linux-watchdog@lfdr.de>; Thu, 31 Mar 2022 23:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbiCaVPA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 31 Mar 2022 17:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235305AbiCaVO7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 31 Mar 2022 17:14:59 -0400
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 31 Mar 2022 14:13:09 PDT
Received: from 1.mo576.mail-out.ovh.net (1.mo576.mail-out.ovh.net [178.33.251.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8354C237FE6
        for <linux-watchdog@vger.kernel.org>; Thu, 31 Mar 2022 14:13:09 -0700 (PDT)
Received: from player772.ha.ovh.net (unknown [10.109.156.220])
        by mo576.mail-out.ovh.net (Postfix) with ESMTP id F214123298
        for <linux-watchdog@vger.kernel.org>; Thu, 31 Mar 2022 20:56:13 +0000 (UTC)
Received: from RCM-web5.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player772.ha.ovh.net (Postfix) with ESMTPSA id D54FC291025F7;
        Thu, 31 Mar 2022 20:55:59 +0000 (UTC)
MIME-Version: 1.0
Date:   Thu, 31 Mar 2022 22:55:59 +0200
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Eduardo Valentin <eduval@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Terry Bowman <terry.bowman@amd.com>,
        Thanh Quan <thanh.quan.xn@renesas.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v5.18 Merge window
In-Reply-To: <20220331182454.GA14072@www.linux-watchdog.org>
References: <20220331182454.GA14072@www.linux-watchdog.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <174471c557f778c0c5e55ca7f9bc02fc@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 1543890248961010630
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgudehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtjehjtddtredvnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeevfedvteejffeufeekueeuvdeghfeggeejgfevvdegieetudeuiedvleettdfhteenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejjedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wim,

On 2022-03-31 20:24, Wim Van Sebroeck wrote:
> This series contains:
> * Add support for BCM4908

It indeed includes
[PATCH] watchdog: allow building BCM7038_WDT for BCM4908

but somehow misses
[PATCH] watchdog: bcm7038_wdt: Support BCM6345 compatible string
(which is Patchwork marked as Accepted).

This is NOT pull blocker, just sth I'd like to ask you to look at for
the next release :)
