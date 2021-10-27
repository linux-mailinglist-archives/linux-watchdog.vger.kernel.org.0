Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676EE43D65A
	for <lists+linux-watchdog@lfdr.de>; Thu, 28 Oct 2021 00:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhJ0WP3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 18:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJ0WP2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 18:15:28 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91A8C061570
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 15:13:02 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id s190so4743909oie.6
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=L6Nyj9BLcFffwrm+GtJV/wi4Vn6geZ70s+U2kAkD1vU=;
        b=lFztWM76cPh7wBt9TMDzRyW3VbUEjRT6dbCe0GMfxZ67nPciYn6rgROQC/9bbfaU6t
         5qE8Ti32RcaFAzDYWKOSDUBGUlj1Xa1ILgBC2TkYqjIcO4EYQJWoRCYNaly7QKZ4UTd9
         LG6Upbd+PgddIa6OnVrxz5NXg1suJfVe9Tn78skVapJ4sdVjKMK5kkY7nAndhUfQBB2i
         /QKsBfqKiCHcztU68T2QhVNQDJT8XkLklGPj1lmWoNNOkBDi53cIlbC+0iPHVKezBi72
         OQ8uF3dT4vJ3HOnZnvkaLCLzmAIq6NjtEK3tWwYnKn+49MxuQbFZpdwA4zrTkuG3fxVs
         3LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=L6Nyj9BLcFffwrm+GtJV/wi4Vn6geZ70s+U2kAkD1vU=;
        b=KyYCBoKtiv+MIA8s3x+16R1eo8L4yJE/AJhfbqyFHFYvlO0GZKKZsMZXeuY+qEMt/u
         hHEduwLDgxuNRByIqApb2mcRlZdvxyrg9AE4WYybtfJZnoCktO9SNk3ErS44mUhng9c7
         GH7kZ2cvfrJf4wg3vyrfe4p/kVmFy5I5bLJCn3PRWdoxmVYkqExK3zuauz0dsLI8wpff
         o9x+NoNayPY/RLhmPBpyuQUWyBdkUMLbxaNSc0jN3XNm364zP0HcwQqv4IHINfFwQ/8o
         /ppi8QrkTX6khkeOGxa09g91VYj0nwAL44+ZBiYlBHiZyrmIXoxeGHZAToSmcO9y8W+g
         weaQ==
X-Gm-Message-State: AOAM530GhYWzNsMzV+4b/TUhwalPAkVnPkMoSgjwlt5KS2HxldXLp7+l
        hCZZ1MrhUXD13l9TnKEmyks=
X-Google-Smtp-Source: ABdhPJyvJldIoJpLr48+MLkkBAgCuN1hDFXfUJ4rClKCrs4oCEyMHXmAmQDo2xmwglHwUx5ve0zvQw==
X-Received: by 2002:a05:6808:221c:: with SMTP id bd28mr5457765oib.9.1635372782239;
        Wed, 27 Oct 2021 15:13:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf3sm603712oib.34.2021.10.27.15.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 15:13:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 27 Oct 2021 15:13:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
Message-ID: <20211027221300.GA342815@roeck-us.net>
References: <20211027123135.27458-1-zajec5@gmail.com>
 <20211027173114.GA2327649@roeck-us.net>
 <7bb51f0f-6ba1-d91a-6e1c-7c7c4f5f3cbc@gmail.com>
 <fe1b90d7-4898-694b-02ae-97baa3377206@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe1b90d7-4898-694b-02ae-97baa3377206@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Oct 27, 2021 at 10:40:07PM +0200, Rafał Miłecki wrote:
> On 27.10.2021 19:39, Florian Fainelli wrote:
> > On 10/27/21 10:31 AM, Guenter Roeck wrote:
> > > On Wed, Oct 27, 2021 at 02:31:35PM +0200, Rafał Miłecki wrote:
> > > > From: Rafał Miłecki <rafal@milecki.pl>
> > > > 
> > > > This fixes:
> > > > drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
> > > > drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
> > > > 
> > > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > 
> > > [reluctantly]
> > > 
> > > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > > 
> > > ... because the driver should really be converted to use the watchdog subsystem,
> > > by someone with the necessary hardware to test it.
> > 
> > The driver should ideally be removed and we should use bcm7038_wdt.c
> > moving forward. Rafal, is this something you can try on 4908?
> 
> I wasn't sure if I should proceed with bcm63xx_wdt.c or bcm7038_wdt.c so
> I chose 63xx. Possibly a bad decision, I'm not sure.
> 
> I've already bcm63xx_wdt.c changes developed locally to support BCM4908.
> I just need to add Documentation/dt-bindings/ part. I'll do that
> tomorrow. Then you can let me know if that's acceptable or should I
> refactor my changes.

I am not sure if that answers your question, but unless you rework the
bcm63xx driver to use the watchdog subsystem (which would make it almost
identical to the bcm7038 driver), I am not going to accept functional
changes to it.

Guenter
