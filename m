Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1919825F
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Aug 2019 20:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfHUSKM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Aug 2019 14:10:12 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35747 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727822AbfHUSKM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Aug 2019 14:10:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id gn20so1755307plb.2;
        Wed, 21 Aug 2019 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=BRaE3rjeT8FCEq2Zbhrcwzz/PytLOULw+1k5/xkFYgY=;
        b=fw2gO6TC8tNLS0jC+pLn1ymEqa+6Ggr3tFsCMDsJFC3AdAQD7uyifHENer7jG+2UUJ
         ocONF3pHy7Z8RN9i1YQb2yGYVRkp2UbPS4r74gmmmzwc7h8NIp3aUIW3N9N3s90+4rWy
         JSptEtCHiSGU85fm6dw+A3PLYMgwU5O04BGuEcBm+x5pNGG2MYIFFyRwMn/5zwDHiV3A
         Cz6pHDAWf04QiXkyXp9A+yp9tqVBtTZMM0zN7V6Oid9atVKXC8NZyO9ggtSOSbB11SXx
         M00zwElWK5r1FQ4PhG1wyNHSPurcUwKL9ugCvQAcWfcpwJ12BCQ1dLTLf3chKJquE+VN
         OGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=BRaE3rjeT8FCEq2Zbhrcwzz/PytLOULw+1k5/xkFYgY=;
        b=bNxk7HNfhHiQRhaCp2d0DUylGjqHQ9bu+DZFbKjTzStLv3jYOCjt/D3chf7n81x6ra
         PLLO/7ywlS8Y+aIGnYeXUtrpLMgm7Z7TiHvGlshbPUrbyBts6TNs0r/3JKu08SEENpmi
         jZvjGoQRmsZlhc8c3DvHCmuie3a4gANBJM3es/khp9sUPrdTtL2iiyLICQ+abnyOZSPS
         zYqTSuj4IbXsrc/0hOUR6Eg6vvv06V+KuC1lnQNdJViQ2bjKjV553an/2xE0CAGptbOe
         r7E1ksmQNVZDPuECZfXweZbus6vbyE/vIDUzCOsOYLU+lUeW/7/TF3TtHTBZbNAmJyfL
         xyXA==
X-Gm-Message-State: APjAAAVNoQUhzVbIZAM+2F2VeG+13k+lxN+GGWRwS6PudUylLEOj+bEy
        MHiddNagvYQCNHPrc3pROUrm+cerxMU=
X-Google-Smtp-Source: APXvYqw7jrvERpK0TvcG5LufdB/a+fUB8Dtj+XOTHWONJ/0UKlGLuryo1MgZMuVh02WFzQekc1vi3w==
X-Received: by 2002:a17:902:9a41:: with SMTP id x1mr18562143plv.88.1566411010884;
        Wed, 21 Aug 2019 11:10:10 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l4sm23809086pff.50.2019.08.21.11.10.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Aug 2019 11:10:10 -0700 (PDT)
Date:   Wed, 21 Aug 2019 11:10:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexander Amelkin <a.amelkin@yadro.com>
Cc:     Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
Message-ID: <20190821181008.GB15127@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
 <20190821163220.GA11547@roeck-us.net>
 <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e7fe5cc-ba1b-b8b6-69c5-c3c6cf508a36@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Aug 21, 2019 at 08:42:24PM +0300, Alexander Amelkin wrote:
> 21.08.2019 19:32, Guenter Roeck wrote:
> > On Wed, Aug 21, 2019 at 06:57:43PM +0300, Ivan Mikhaylov wrote:
> >> Set WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION into WDT_CLEAR_TIMEOUT_STATUS
> >> to clear out boot code source and re-enable access to the primary SPI flash
> >> chip while booted via wdt2 from the alternate chip.
> >>
> >> AST2400 datasheet says:
> >> "In the 2nd flash booting mode, all the address mapping to CS0# would be
> >> re-directed to CS1#. And CS0# is not accessable under this mode. To access
> >> CS0#, firmware should clear the 2nd boot mode register in the WDT2 status
> >> register WDT30.bit[1]."
> > Is there reason to not do this automatically when loading the module
> > in alt-boot mode ? What means does userspace have to determine if CS0
> > or CS1 is active at any given time ? If there is reason to ever have CS1
> > active instead of CS0, what means would userspace have to enable it ?
> 
> Yes, there is. The driver is loaded long before the filesystems are mounted. The filesystems, in the event of alternate/recovery boot, need to be mounted from the same chip that the kernel was booted. For one reason because the main chip at CS0 is most probably corrupt. If you clear that bit when driver is loaded, your software will not know that and will try to mount the wrong filesystems. The whole idea of ASPEED's switching chipselects is to have identical firmware in both chips, without the need to process the alternate boot state in any way except for indicating a successful boot and restoring access to CS0 when needed.
> 
> The userspace can read bootstatus sysfs node to determine if an alternate boot has occured.
> 
> With ASPEED, CS1 is activated automatically by wdt2 when system fails to boot from the primary flash chip (at CS0) and disable the watchdog to indicate a successful boot. When that happens, both CS0 and CS1 controls  get routed in hardware to CS1 line, making the primary flash chip inaccessible. Depending on the architecture of the user-space software, it may choose to re-enable access to the primary chip via CS0 at different times. There must be a way to do so.
> 
So by activating cs0, userspace would essentially pull its own root file system
from underneath itself ?

> > If userspace can not really determine if CS1 or CS0 is active, all it could
> > ever do was to enable CS0 to be in a deterministic state. If so, it doesn't
> > make sense to ever have CS1 active, and re-enabling CS0 could be automatic.
> >
> > Similar, if CS1 can ever be enabled, there is no means for userspace to ensure
> > that some other application did not re-enable CS0 while it believes that CS1
> > is enabled. If there is no means for userspace to enable CS1, it can never be
> > sure what is enabled (because some other entity may have enabled CS0 while
> > userspace just thought that CS1 is still enabled). Again, the only means
> > to guarantee a well defined state would be to explicitly enable CS0 and provive
> > no means to enable CS1. Again, this could be done during boot, not requiring
> > an explicit request from userspace.
> 
> Please understand that activation of CS1 in place of CS0 is NOT a software choice!
> 
> 
> >> +	if (unlikely(!wdt))
> >> +		return -ENODEV;
> >> +
> > How would this ever happen, and how / where is drvdata set to NULL ?
> 
> This is purely for robustness. Seeing a pointer obtained via a function accessed without first checking it for validity makes me nervous.
> 
This is not how kernel code is commonly written.
Sure, we could add similar checks to each sysfs access code in the kernel,
blowing up its size significantly. I do not see a point of this.

> This code most probably adds nothing at the assembly level.
> 
That seems quite unlikely. Please demonstrate.

> >
> >> +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> >> +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> >> +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > The variable reflects the _boot status_. It should not change after booting.
> Is there any documentation that dictates that? All I could find is
> 
> "bootstatus: status of the device after booting". That doesn't look to me like it absolutely can not change to reflect the updated status (that is, to reflect that the originally set up alternate CS routing has been reset to normal).
> 
You choose to interpret "after booting" in a kind of novel way,
which I find a bit disturbing. I am not really sure how else to
describe "boot status" in a way that does not permit such
reinterpratation of the term.

On top of that, how specifically would "WDIOF_EXTERN1" reflect
what you claim it does ? Not only you are hijacking bootstatus9
(which is supposed to describe the reason for a reboot), you
are also hijacking WDIOF_EXTERN1. That seems highly arbitrary
to me, and is not really how an API/ABI should be used.

Guenter

> If you absolutely disallow that, I think we could make 'access_cs0' readable instead, so it could report the current state of the boot code selection bit. Reverted, I suppose. That way 'access_cs0' would report 1 after 1 has been written to it (it wouldn't be possible to write a zero).
> 
> > @@ -223,6 +248,9 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
> >  
> >  	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> >  
> > +	if (of_property_read_bool(np, "aspeed,alt-boot"))
> > +		wdt->wdd.groups = bswitch_groups;
> > +
> > Why does this have to be separate to the existing evaluation of
> > aspeed,alt-boot, and why does the existing code not work ?
> >
> > Also, is it guaranteed that this does not interfer with existing
> > support for alt-boot ?
> 
> I think Ivan will comment on this.
> 
> With best regards,
> Alexander Amelkin,
> BIOS/BMC Team Lead, YADRO
> https://yadro.com
> 
> 



