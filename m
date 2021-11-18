Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E723C456143
	for <lists+linux-watchdog@lfdr.de>; Thu, 18 Nov 2021 18:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbhKRRSp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 18 Nov 2021 12:18:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbhKRRSp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 18 Nov 2021 12:18:45 -0500
Received: from polaris.svanheule.net (polaris.svanheule.net [IPv6:2a00:c98:2060:a004:1::200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095A3C061574
        for <linux-watchdog@vger.kernel.org>; Thu, 18 Nov 2021 09:15:44 -0800 (PST)
Received: from [IPv6:2a02:a03f:eafe:c901:baf4:d6c5:5600:301] (unknown [IPv6:2a02:a03f:eafe:c901:baf4:d6c5:5600:301])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sander@svanheule.net)
        by polaris.svanheule.net (Postfix) with ESMTPSA id 2F42227385D;
        Thu, 18 Nov 2021 18:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
        s=mail1707; t=1637255743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QgYHfXZl7fEBUWDEwQ3rgbcDzTDWb/LKD5PuawmAAMs=;
        b=uUasYc2WgM3xuOmvaH90/p4u05dnyGrlv0kbTh4TInjuxMyYsgO9N5ggQpZjAXDrkL3t9m
        lAr25lvNs7e0OK9y6rcRpFep9/8UFVvxn0oF3OrigJGCySbz7O9T+HGPG26HSa2ESTxtKS
        3Z5E8f+mfZ1IrVqWTNbjcK2XHK9Hmy9qaZ41pkh9Yi5t2wyQ7mjU3a5qPfDU3nhdMHFZWW
        5mKGbFCgjQ49LBLWx1l5jqbpsVZWxqwo9XWHGtdjk33CEnq2EZbtN1I9olwcIuPKDglaAh
        m+79xbed7eY6PU7rFqJHZFIuVAG59pAeQObPmOiBd0iXUofZ8uVFdGbU0v/jQw==
Message-ID: <e311fa3e7a187ca32920534310b0a0cbd3b6526f.camel@svanheule.net>
Subject: Re: [PATCH v3 2/2] watchdog: Add Realtek Otto watchdog timer
From:   Sander Vanheule <sander@svanheule.net>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Date:   Thu, 18 Nov 2021 18:15:41 +0100
In-Reply-To: <62050743-bc11-cc21-c6ae-0be9d7b5633c@roeck-us.net>
References: <cover.1636018117.git.sander@svanheule.net>
         <2dbf0c6e0eebf523008c15794434d2d1a9b1260e.1636018117.git.sander@svanheule.net>
         <20211117052054.GA215087@roeck-us.net>
         <787cfd2ab58fb7f1d841f0ced261213f9c2050ae.camel@svanheule.net>
         <62050743-bc11-cc21-c6ae-0be9d7b5633c@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

On Wed, 2021-11-17 at 04:42 -0800, Guenter Roeck wrote:
> On 11/16/21 11:13 PM, Sander Vanheule wrote:
> > Hi Guenter,
> > 
> > On Tue, 2021-11-16 at 21:20 -0800, Guenter Roeck wrote:
> > > On Thu, Nov 04, 2021 at 10:32:13AM +0100, Sander Vanheule wrote:
> > > > Realtek MIPS SoCs (platform name Otto) have a watchdog timer with
> > > > pretimeout notifitication support. The WDT can (partially) hard reset,
> > > > or soft reset the SoC.
> > > > 
> > > > This driver implements all features as described in the devicetree
> > > > binding, except the phase2 interrupt, and also functions as a restart
> > > > handler. The cpu reset mode is considered to be a "warm" restart, since
> > > > this mode does not reset all peripherals. Being an embedded system
> > > > though, the "cpu" and "software" modes will still cause the bootloader
> > > > to run on restart.
> > > > 
> > > > It is not known how a forced system reset can be disabled on the
> > > > supported platforms. This means that the phase2 interrupt will only fire
> > > > at the same time as reset, so implementing phase2 is of little use.
> > > > 
> > > > Signed-off-by: Sander Vanheule <sander@svanheule.net>
> > > 
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > Thank you for the review! In the meantime, I was preparing a v4 of this series with some
> > small changes (see inline below). Could you let me know if I can keep your Reviewed-by
> > with those changes?
> > 
> 
> I think it would be better to re-review it.

I sent out the v4 a bit later than expected, because I hit a regression for the irqchip on
this platform:
https://lore.kernel.org/all/bbe5506a2458b2d6049bd22a5fda77ae6175ddec.camel@svanheule.net/


Best,
Sander
