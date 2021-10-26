Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5F243BAAF
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Oct 2021 21:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhJZT1q (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 26 Oct 2021 15:27:46 -0400
Received: from www.linux-watchdog.org ([185.87.125.42]:37438 "EHLO
        www.linux-watchdog.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbhJZT1q (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 26 Oct 2021 15:27:46 -0400
X-Greylist: delayed 346 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Oct 2021 15:27:45 EDT
Received: by www.linux-watchdog.org (Postfix, from userid 500)
        id 544EF409F1; Tue, 26 Oct 2021 19:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 544EF409F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
        s=odk20180602; t=1635270927;
        bh=XEy+92kcFrjoz1chiIXUZH+VltwEnwXUGrSzXFbIO7k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LxR9gI0czzWW7oChDNqxHfkfyKWT0iN792RvezJzAVzPloSIsYixn1gaDj4Q1sT5X
         LbRMPU4Cjy83+GKjo1Hb6CLupzJaeHp8p7oZl0SE3pCkCCjA7ySq0AbCF9jB0VTPKO
         dtTDo7n5LrRUlNbnbIBewHOwrFqnaf+sDk/wuRck=
Date:   Tue, 26 Oct 2021 19:55:27 +0200
From:   Wim Van Sebroeck <wim@linux-watchdog.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: iTCO: Drop vendor support
Message-ID: <20211026175527.GA13868@www.linux-watchdog.org>
References: <20211008152637.141673-1-linux@roeck-us.net>
 <ad2d002c-1593-62c3-934c-4c41c465fd41@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2d002c-1593-62c3-934c-4c41c465fd41@roeck-us.net>
User-Agent: Mutt/1.5.20 (2009-12-10)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

> On 10/8/21 8:26 AM, Guenter Roeck wrote:
> >iTCO vendor support was introduced in 2006 to support SuperMicro boards
> >with Pentium 3 CPUs. It was extended in 2009 to support motherbords
> >with broken BIOS (specifically Intel DG33TL). The code is long since
> >obsolete, so let's drop support for it.
> >
> >Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Wim - this patch is buggy. Please don't apply it.

Noted.

Kind regards,
Wim.

