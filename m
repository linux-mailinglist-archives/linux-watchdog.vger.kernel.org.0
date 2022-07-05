Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3DCC56781F
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Jul 2022 21:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbiGET4T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 Jul 2022 15:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiGET4S (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 Jul 2022 15:56:18 -0400
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B44191261C;
        Tue,  5 Jul 2022 12:56:17 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id p128so12176835iof.1;
        Tue, 05 Jul 2022 12:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+aMFooU9xCxHHZrJKfw9pGmy9FIGPoeaxgRsrA1Zlmo=;
        b=3oz5sr1VMvnqCLJxKsLPMUY1ppWfrt8BNZk8fub3Wg+XME99l3kkcASzLHtz7G4bxP
         WFABPoQtJyiXs5+ojDkvG+YCRsrW3B3IxNzR06czNtDBsivaxz/ICt9U/N8G0/qhWiOd
         WGABjTIaiQUhXRh1pOHJTSmZvmeSETpIDbil9maNznFTllcchKgDP7QxKkMLPvI9LmyH
         5gVH5s65aLAe5GkpQvuXYM2r/AvpqtTkd6ajqpj++Y6gntq/FJALseOWPjqSOO1UQ62Y
         pGEogGj8TPoO5tA0O9We0FCrbkGbhGdCrWIiMJpYlY3+D0jwY/NTOC6WDdSMhAiovmMT
         FW0g==
X-Gm-Message-State: AJIora+PcNSX6UY6xePmDB8MBuE5hGOuDr9ldEsO+IzrTHV9gEORYUqm
        ULT+7Hc3Ektu2EHF6tY+TmoyQeZEfA==
X-Google-Smtp-Source: AGRyM1smOYjSvNNRbRQ+Nx0BkkSK8fx9zwOREBJuUwxAQXwlvwpNOZy8pzc9WdT0YVAi1EBDTCjTGw==
X-Received: by 2002:a05:6638:1347:b0:33e:9dd1:d3f6 with SMTP id u7-20020a056638134700b0033e9dd1d3f6mr16311464jad.131.1657050976931;
        Tue, 05 Jul 2022 12:56:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bw14-20020a056638460e00b0033ca26010besm11000638jab.148.2022.07.05.12.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 12:56:16 -0700 (PDT)
Received: (nullmailer pid 2526157 invoked by uid 1000);
        Tue, 05 Jul 2022 19:56:14 -0000
Date:   Tue, 5 Jul 2022 13:56:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Isaac True <isaac.true@canonical.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
Message-ID: <20220705195614.GA2503171-robh@kernel.org>
References: <20220629110626.2158127-1-isaac.true@canonical.com>
 <20220629110626.2158127-2-isaac.true@canonical.com>
 <20220701171829.GA1149706-robh@kernel.org>
 <0d045bb8-a519-39d4-17fa-123f90969bd9@roeck-us.net>
 <CALkPoPYKNxAeP6HM1cMh1zzW6jw4fktCp42b7+79Qf8DVJis-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALkPoPYKNxAeP6HM1cMh1zzW6jw4fktCp42b7+79Qf8DVJis-w@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 04, 2022 at 01:05:04PM +0200, Isaac True wrote:
> On Fri, 1 Jul 2022 at 19:48, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 7/1/22 10:18, Rob Herring wrote:
> > > On Wed, Jun 29, 2022 at 01:06:26PM +0200, Isaac True wrote:
> > >> Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
> > >> minimum interval to be specified, stopping watchdog devices from being
> > >> fed too quickly if they require a certain interval between feeds.
> > >
> > > I assume there is some real platform with a real problem you are trying
> > > to solve? Details please.
> > >
> >
> > Agreed, this should be explained in more detail.
> 
> Yes this is a real platform using a TI TPS3850 watchdog chip. With
> this chip you can configure a "window" which can detect early faults
> (i.e. too frequent) in addition to the standard watchdog features. I
> needed to add this minimum timeout to avoid watchdog resets in
> situations such as where first U-Boot and then the Linux kernel feed
> the watchdog with too short of an interval between them, or when
> systemd was configured to use the watchdog device and was feeding it
> too soon after taking over from the kernel.
> 
> > > Can you just hardcode some min? Maybe 10% of the max or something. Is
> > > there a downside to a larger than necessary min?
> > >
> >
> > That would result in extra overhead in the watchdog core which would not
> > be required for all other hardware using this driver. I'd rather avoid that.
> >
> 
> In the case of the TI TPS3850, the minimum timeout is configurable, so
> I didn't want to add a hard-coded value to the driver.
> 
> > > Wouldn't be better to fix this without requiring a DT change and that
> > > could work on stable kernels if needed.
> > >
> >
> > Presumably that is some new hardware. Most of the watchdog drivers
> > needing this value can derive it from the compatible property. The
> > gpio watchdog driver is a bit different since it is supposed to work
> > on a variety of hardware using gpio pins for watchdog control.
> >
> 
> Yes this is new hardware. This use case is also not very common as
> most watchdog chips don't have this window function or a minimum
> interval, at least in my experience, so I did not want to make it the
> default for everything.

Okay. However the existing property you copied has 2 problems. It uses 
underscores rather than hypens and doesn't use a standard unit suffix. 
So 'min-hw-margin-ms'.

Though maybe a new property instead:

timeout-range-ms = <min max>;

That's somewhat aligned to 'timeout-sec', and IMO, clearer meaning than 
'hw margin'.

Rob
