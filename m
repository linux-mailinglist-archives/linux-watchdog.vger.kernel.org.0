Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA7946725
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Jun 2019 20:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfFNSIi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Jun 2019 14:08:38 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:52461 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfFNSIi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Jun 2019 14:08:38 -0400
X-Originating-IP: 37.205.120.66
Received: from localhost (unknown [37.205.120.66])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5A6AF40003;
        Fri, 14 Jun 2019 18:08:29 +0000 (UTC)
Date:   Fri, 14 Jun 2019 20:08:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ken Sloat <KSloat@aampglobal.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
        "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] watchdog: atmel: atmel-sama5d4-wdt: Disable
 watchdog on system suspend
Message-ID: <20190614180826.GD3369@piout.net>
References: <20190614125310.29458-1-ksloat@aampglobal.com>
 <20190614164609.GA29814@roeck-us.net>
 <BL0PR07MB4115E99D065FD9BEA4C43BB5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR07MB4115E99D065FD9BEA4C43BB5ADEE0@BL0PR07MB4115.namprd07.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 14/06/2019 17:53:01+0000, Ken Sloat wrote:
> > The call to sama5d4_wdt_init() above now explicitly stops the watchdog
> > even if we want to (re)start it. I think this would be better handled with an
> > else case here
> > 
> >         else
> >                 sama5d4_wdt_stop(&wdt->wdd);
> > 
> 
> So we completely remove the sama5d4_wdt_init() call then correct?
> 
> To leave the code as it behaves today with the addition
> of wdt stop/start, shouldn't we call init in the else instead?
> 
> 	if (watchdog_active(&wdt->wdd))
> 		sama5d4_wdt_start(&wdt->wdd);
> 	else
> 		sama5d4_wdt_init();
> 
> I guess I don't really understand the purpose of having the init statement in resume
> in the first place. I agree, calling this first does end up essentially resetting the wdt
> it will start again if it was running before, but the count will be reset.
> 

There is a nice comment explaining why ;)


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
