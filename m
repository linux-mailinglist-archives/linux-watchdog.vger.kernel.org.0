Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F13747067
	for <lists+linux-watchdog@lfdr.de>; Sat, 15 Jun 2019 16:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfFOOWT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 15 Jun 2019 10:22:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41587 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfFOOWT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 15 Jun 2019 10:22:19 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so3123254pff.8;
        Sat, 15 Jun 2019 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4jcVnha6T/SSJcKsN+RA/B8GQPj4ptbm/niXDT+3DzY=;
        b=mk2sKC3F5T58Z1iiRMMJtRkKPF2mkjQjQRK2iNpYMAZt4DuB2xtt3Mbq2HgnMn6wnS
         7SPYL0jEB8/hrXOtg6GghB6mo1YLz38IXSyl8ctZdnvwYFZzMiOaxipPYUjfE7RrdOzR
         RZqeah6HQjJ09p2OOMcUN7EMDgKx6E7FONWErjUjrry8l66bFuLZd6ODEZIClaPDEkk5
         rXIjJuYADfRnOSjEbcbyOSnEXxbIi8n536c88BIxDrZANlgRehtW1fcUHZTjtheuqr9+
         d3wtXaY95UHrWeAtlptMuV7IZeaLJreOGIlehXjVoNRQvU9gIITY7PsRipzhmLkEggkh
         i1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4jcVnha6T/SSJcKsN+RA/B8GQPj4ptbm/niXDT+3DzY=;
        b=s+TVygiSbZo0L3R5mFFjzT/h3pPsH4NdWn7UlNRUtoebW6DO4mDeAMoLXuTT4+aXZ4
         jF3obZ5VxvSoXqIN5TSL45Gl/OT3mdqmRQEUFYWIaA4sFYV98Klx68idQv/AdtQJ62kL
         5Aq/o5vuoCCwMw64IkxRDWE6gJ9nkLLeIa1W/UU36+uTJOAY9jBA+00GUdgIlbFYSROk
         TcIgR3bghzXPGKZLq4qNKyy4MhQuFIygS70xFCAoZ7NNmq+RHNTNEssA916iDaVHnUUJ
         kTF0KglV4tx+rRdOiCtxQT7hhx6pOCXS0hyW4W6PnWMmCbeE17Prtv6G9Zd9pmh1+F/j
         41ug==
X-Gm-Message-State: APjAAAU7d0jacTr/5A8GBW5ohw7kBSKGhIlYAvWplIKnp77IvE4k3gBa
        sIj45q+UPoi8bcjERnX/gGI0FNy9
X-Google-Smtp-Source: APXvYqwVayNboag+Dn8UwiSaLd6i9GFJKHjWbJ0mgRF9hnnKtw+1Vr+mwRUJaDySVmvmTyAXT2kCrg==
X-Received: by 2002:a17:90a:e38f:: with SMTP id b15mr16850637pjz.85.1560608538196;
        Sat, 15 Jun 2019 07:22:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e184sm10290803pfa.169.2019.06.15.07.22.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 07:22:17 -0700 (PDT)
Date:   Sat, 15 Jun 2019 07:22:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Message-ID: <20190615142216.GA32514@roeck-us.net>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
 <20190614164609.GA29814@roeck-us.net>
 <BL0PR07MB4115E99D065FD9BEA4C43BB5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190614180826.GD3369@piout.net>
 <BL0PR07MB4115D5ECDEDCC028197637E5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
 <20190614203327.GE3369@piout.net>
 <BL0PR07MB4115721DA2EB445BE7590BF6ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR07MB4115721DA2EB445BE7590BF6ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 14, 2019 at 08:45:28PM +0000, Ken Sloat wrote:
> > -----Original Message-----
> > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Sent: Friday, June 14, 2019 4:33 PM
> > To: Ken Sloat <KSloat@aampglobal.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>; nicolas.ferre@microchip.com;
> > ludovic.desroches@microchip.com; wim@linux-watchdog.org; linux-arm-
> > kernel@lists.infradead.org; linux-watchdog@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
> > watchdog on system suspend
> > 
> > [This is an EXTERNAL EMAIL]
> > ________________________________
> > 
> > On 14/06/2019 18:43:22+0000, Ken Sloat wrote:
> > > Well I'm a little confused still because there are two separate
> > > comments in these statements. The first within resume implies that the
> > > init should be called because we might have lost register values for
> > > some reason unexplained.
> > 
> > The sama5d2 has a suspend mode where power to the core is completely
> > cut. Only a few IPs remain powered (in the backup power domain).
> > Unfortunately, the watchdog is not in that domain and may lose its registers.
> > 
> > > Then within the init it says that the bootloader might have modified
> > > the registers so we should check them and then update it or otherwise
> > > disable it. I'm not trying to pick apart the logic or anything, I'm
> > > just readily assuming it is good as it was already reviewed before.
> > >
> > 
> > The bootloaders may have started the watchdog (this makes sense if you
> > really care about reliability) and so we need to be careful to keep the proper
> > parameters.
> 
> Thanks for the explanation Alexandre I appreciate it.
> 
> > > So without digging into that too much, if we don't know if any of the
> > > runtime situations above might have occurred, then isn't it best to
> > > leave my patch as is? Yes this has the side effect of resetting the
> > > timer count, but if the init call is needed and we don't have any way
> > > to know if any of the situations occurred, then we have no choice right?
> > >
> > 
> > Until we can differentiate between suspend modes, we have no other
> > choice.
> 
> Ok I will leave my patch as is for now then
> 

If that is what those involved in this discussion argue for, they will
need to confirm with Reviewed-by: or Acked-by: tags.

Thanks,
Guenter

> > --
> > Alexandre Belloni, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> Thanks,
> Ken Sloat
