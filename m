Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C18402FDB
	for <lists+linux-watchdog@lfdr.de>; Tue,  7 Sep 2021 22:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239567AbhIGUrq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 7 Sep 2021 16:47:46 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:33928 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbhIGUrq (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 7 Sep 2021 16:47:46 -0400
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 03F44409F1; Tue,  7 Sep 2021 21:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 03F44409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1631042715;
        bh=PGkuTDCDd3i6DC4bFdpQ/fveXnx7OxAThx5/gh+kQE4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfGp9Tw9UUuxoESjNY1Z9NPBcdwmZPeOlRISNrl6hAoGQmaf1II6ikxomjPfccmyX
         pta8FigjEnQgRsduZbYlY0wzJzbk5NIqxUSqdwYi27blxzKgvPmS0PAy4TqGSZ/nTk
         XESiO6u/7J/WZ3WLSaEe5kJKlBmRZ6z51ynCgto4=
Date:   Tue, 7 Sep 2021 21:25:14 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Christine Zhu <Christine.Zhu@mediatek.com>,
        Curtis Klein <curtis.klein@hpe.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v5.12 Merge window
Message-ID: <20210907192514.GA18886@www.linux-watchdog.org>
References: <20210907191139.GA18865@www.linux-watchdog.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907191139.GA18865@www.linux-watchdog.org>
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Linus,

My Apologies. The subject of this e-mail is wrong again. It should have been [GIT PULL REQUEST] watchdog - v5.15 Merge window

Sorry,
Wim.

