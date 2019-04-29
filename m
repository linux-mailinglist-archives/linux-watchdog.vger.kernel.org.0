Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8618DEA0C
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 20:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfD2SXj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 14:23:39 -0400
Received: from mail5.windriver.com ([192.103.53.11]:60530 "EHLO mail5.wrs.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728844AbfD2SXj (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 14:23:39 -0400
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
        by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3TILLIE026205
        (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
        Mon, 29 Apr 2019 11:21:37 -0700
Received: from yow-pgortmak-d1.corp.ad.wrs.com (128.224.56.57) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.439.0; Mon, 29 Apr 2019 11:21:20 -0700
Received: by yow-pgortmak-d1.corp.ad.wrs.com (Postfix, from userid 1000)        id
 4C7C52E0DEE; Mon, 29 Apr 2019 14:21:20 -0400 (EDT)
Date:   Mon, 29 Apr 2019 14:21:20 -0400
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular
Message-ID: <20190429182120.GZ23044@windriver.com>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
 <20190429164014.GA14357@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190429164014.GA14357@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

[Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular] On 29/04/2019 (Mon 09:40) Guenter Roeck wrote:

> On Tue, Apr 23, 2019 at 11:48:33AM -0400, Paul Gortmaker wrote:
> > The Kconfig currently controlling compilation of this code is:
> > 
> > config NPCM7XX_WATCHDOG
> >        bool "Nuvoton NPCM750 watchdog"
> > 
> > ...meaning that it currently is not being built as a module by anyone.
> > 

[...]

> I'll send a different patch to make the driver tristate,
> to follow the example given by other drivers for the same chipset.

Great, thanks.  I'll drop this patch from my internal queue once I see
it conflict with your tristate conversion in linux-next.

Paul.
--

> 
> Guenter
