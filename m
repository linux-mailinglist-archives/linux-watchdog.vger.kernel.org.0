Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA2C8F34C5
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2019 17:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbfKGQlI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Nov 2019 11:41:08 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34609 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729775AbfKGQlI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Nov 2019 11:41:08 -0500
Received: by mail-pl1-f196.google.com with SMTP id k7so1869140pll.1;
        Thu, 07 Nov 2019 08:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bg6kqSIBxYXX6N9owOwBDRy3DhfK9Nfe+pI6Kd3oi9c=;
        b=c2ToS8faBSqCzfedGrU0wMS2D4Qu7ZHy/dBBCR57h46vqBxMe9HoET5KzgLXGEGvMS
         3KI5OJaNqwyvAW3Veq0cBIHKIXq4goSYuryyLiMpRymaPzukb55Rwq8AqD6gODbfedbI
         IVmtcs6oOGuPXG1prJr/e4FDdUfun83VkQOYKqYzhkM2jl6WTt7FBDCtYGyfr7dW3Tq3
         4ZUvcPoKX0VYTM39k1kW1aoPOufqKUTL3K6Js+zqoJcQm2B7CSRhHwUlEYEK0Jp/rw5U
         sxigbGFKlzV/Caeu6Z8nMdt0XDvzXHLkFtysrEJKYTbEE05xo6WMBSj78rZWFG08IsBa
         X5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=bg6kqSIBxYXX6N9owOwBDRy3DhfK9Nfe+pI6Kd3oi9c=;
        b=P4bfgxAAMUU7U1YJPtjIzGnnwh6qD4O7Rbx5XycRkOJXaq74gacPwiXqbcwBY4CFUb
         VBy6ULTLo6MvmeyAe0ozWJKtmCAS5bCn8QydU0PfUhJm88BSFnmX4YJKfhNMXb/slFRZ
         +W9pQJ5lB5VO9NyPOqJqlInfhSQjglcFynGU/cv1zDubFopYigHKQ/3w2jD7TsVnuvxN
         KPSsRXSxjszPlO27DKAXtPIEPlEw5nqW/0alF7lEzsNxX0Ry9Vm6Auk9/HMbuloS18r8
         yMByh8kwFMNFv6Sb7jhAEhZw7cxBW+TjMiAbIqt+F0l+TlYUd0+kWmFhW+4iMSy7jNrU
         XBFg==
X-Gm-Message-State: APjAAAXS5e2IMTcOl5Bfq+SEFkAdYJHHdA02XCrwVDK7rF9t+5CJyxPh
        DwXokXPH8TSJX1iAItwR80c=
X-Google-Smtp-Source: APXvYqz+yUC70FeNjMNghD4MEe6mV1Uw81F8V0J/pDKFKNS4LOFazlyFVX8zGdYiz34uEGYKXlHeVQ==
X-Received: by 2002:a17:902:5a41:: with SMTP id f1mr4789890plm.168.1573144867702;
        Thu, 07 Nov 2019 08:41:07 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a6sm4438511pja.30.2019.11.07.08.41.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Nov 2019 08:41:06 -0800 (PST)
Date:   Thu, 7 Nov 2019 08:41:04 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     wim@linux-watchdog.org, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] watchdog: sama5d4_wdt: addition of sam9x60
 compatible watchdog
Message-ID: <20191107164104.GA7693@roeck-us.net>
References: <1571648890-15140-1-git-send-email-eugen.hristev@microchip.com>
 <1571648890-15140-2-git-send-email-eugen.hristev@microchip.com>
 <20191029132831.GA5643@roeck-us.net>
 <28c6b394-ae88-f913-312e-6b38be1dc5a8@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28c6b394-ae88-f913-312e-6b38be1dc5a8@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 07, 2019 at 12:51:15PM +0000, Eugen.Hristev@microchip.com wrote:
> 
> >>   
> >> -	if ((wdt->mr & AT91_WDT_WDFIEN) && irq) {
> >> +	irq = irq_of_parse_and_map(dev->of_node, 0);
> >> +	if (!irq) {
> >> +		dev_warn(dev, "failed to get IRQ from DT\n");
> >> +		wdt->need_irq = 0;
> > 
> > Does it make sense to ignore that ?
> 
> Hi Guenter,
> 
> Can you detail what exactly is ignored ?
> 
The missing interrupt.

> >> +static struct sama5d4_wdt_data sama5d4_config;
> >> +
> >> +static struct sama5d4_wdt_data sam9x60_config = {
> >> +	.sam9x60_support = 1,
> >> +};
> > 
> > Unless there is reason to believe that there will be other
> > configuration data, please just assign the flag value directly
> > to .data and add a variable to struct sama5d4_wdt to access it.
> > Please make that variable a bool.
> 
> There will be more configuration data for future products, but not at 
> this moment. Do the change or keep it this way ?
> 
If not as part of this series, it is better to just assign
the flag directly. If there are changes coming at a later time
which indeed need a structure (with more than one object in it),
that structure can be added at that time.

Guenter
