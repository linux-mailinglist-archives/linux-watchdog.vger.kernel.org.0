Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5669F43E19
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 17:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731760AbfFMPrc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 11:47:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39870 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731754AbfFMJ3B (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Jun 2019 05:29:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3AAD025B7FA;
        Thu, 13 Jun 2019 19:28:58 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 34626940483; Thu, 13 Jun 2019 11:28:56 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:28:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] watchdog: renesas_wdt: Add a few cycles delay
Message-ID: <20190613092855.hqbsgzil4xl6owyz@verge.net.au>
References: <1559711040-29779-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190607174411.GA15497@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190607174411.GA15497@roeck-us.net>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 07, 2019 at 10:44:11AM -0700, Guenter Roeck wrote:
> [Note: I updated the subject to "PATCH v3"]
> 
> On Wed, Jun 05, 2019 at 02:04:00PM +0900, Yoshihiro Shimoda wrote:
> > According to the hardware manual of R-Car Gen2 and Gen3,
> > software should wait a few RLCK cycles as following:
> >  - Delay 2 cycles before setting watchdog counter.
> >  - Delay 3 cycles before disabling module clock.
> > 
> > So, this patch adds such delays.
> > 
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

