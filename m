Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50FD57283A
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Jul 2022 23:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiGLVEg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Jul 2022 17:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiGLVEf (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Jul 2022 17:04:35 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A95BCAF1B;
        Tue, 12 Jul 2022 14:04:35 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id u6so8947737iop.5;
        Tue, 12 Jul 2022 14:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B9l0hEIECVZDQ3QXPwtwyskyfVTnfIEfp72jU2ng/o4=;
        b=cvVYCOvOnf3nxvx+egPGO+FmvzirlF+Af7B9hUeZVTGTFHuCpg5AliiYZ2KycFPDWp
         P6/wwUAe6qHEqDv6AKV8bSpXOg7TwJ5oXA7w+cnvNmYVYEG0hipXRJAJBWqFERQLaMsj
         cNZDUGXOx6Ms0mR2euVtMK55xbUNtB33rNXLJfADhIpHc7jwy1EwnDC81mPMPpfJ48eG
         BRWiQNUDZYfx8YIowbvhPoGuy1rFs6zU5IQ74937Qp3X4k70RN3/q9EzL9v//YwwWAuX
         2y39mMaOocHmhVrIsomLnij4wzsKPGsGPowIZ+7Z3EY0aSAcGqHRDNmVqsk5WWYyV/QV
         tN1w==
X-Gm-Message-State: AJIora//Y8NSxKiIKmh7q7OyHfpsm/RlZG8XcbpNCgNXgcs+67Q6XQyw
        zBYG1EThGBqca3nnoNeHHw==
X-Google-Smtp-Source: AGRyM1s4D6fFKHbmJgajbZApfQiCmilN6Wafon4NHMPyM2CPmy1WKz/5rLttQgt0pobnReBbHVKJlA==
X-Received: by 2002:a05:6638:3494:b0:33f:62fa:d95d with SMTP id t20-20020a056638349400b0033f62fad95dmr15721jal.318.1657659874064;
        Tue, 12 Jul 2022 14:04:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u6-20020a5edd46000000b0067b7360dd5dsm5529940iop.4.2022.07.12.14.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 14:04:33 -0700 (PDT)
Received: (nullmailer pid 2359803 invoked by uid 1000);
        Tue, 12 Jul 2022 21:04:32 -0000
Date:   Tue, 12 Jul 2022 15:04:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Isaac True <isaac.true@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        wim@linux-watchdog.org
Subject: Re: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
Message-ID: <20220712210432.GP1823936-robh@kernel.org>
References: <20220629110626.2158127-1-isaac.true@canonical.com>
 <20220629110626.2158127-2-isaac.true@canonical.com>
 <20220701171829.GA1149706-robh@kernel.org>
 <0d045bb8-a519-39d4-17fa-123f90969bd9@roeck-us.net>
 <CALkPoPYKNxAeP6HM1cMh1zzW6jw4fktCp42b7+79Qf8DVJis-w@mail.gmail.com>
 <20220705195614.GA2503171-robh@kernel.org>
 <CALkPoPY49PGNk84spUF3BesdZoUFpq++D1NYd_1ouT2Cv4wDYQ@mail.gmail.com>
 <20220708114425.GA2164221@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708114425.GA2164221@roeck-us.net>
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

On Fri, Jul 08, 2022 at 04:44:25AM -0700, Guenter Roeck wrote:
> On Thu, Jul 07, 2022 at 11:00:45AM +0200, Isaac True wrote:
> > On Tue, 5 Jul 2022 at 21:56, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, Jul 04, 2022 at 01:05:04PM +0200, Isaac True wrote:
> > > > On Fri, 1 Jul 2022 at 19:48, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > >
> > > > > On 7/1/22 10:18, Rob Herring wrote:
> > > > > > On Wed, Jun 29, 2022 at 01:06:26PM +0200, Isaac True wrote:
> > > > > >> Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
> > > > > >> minimum interval to be specified, stopping watchdog devices from being
> > > > > >> fed too quickly if they require a certain interval between feeds.
> > > > > >
> > > > > > I assume there is some real platform with a real problem you are trying
> > > > > > to solve? Details please.
> > > > > >
> > > > >
> > > > > Agreed, this should be explained in more detail.
> > > >
> > > > Yes this is a real platform using a TI TPS3850 watchdog chip. With
> > > > this chip you can configure a "window" which can detect early faults
> > > > (i.e. too frequent) in addition to the standard watchdog features. I
> > > > needed to add this minimum timeout to avoid watchdog resets in
> > > > situations such as where first U-Boot and then the Linux kernel feed
> > > > the watchdog with too short of an interval between them, or when
> > > > systemd was configured to use the watchdog device and was feeding it
> > > > too soon after taking over from the kernel.
> > > >
> > > > > > Can you just hardcode some min? Maybe 10% of the max or something. Is
> > > > > > there a downside to a larger than necessary min?
> > > > > >
> > > > >
> > > > > That would result in extra overhead in the watchdog core which would not
> > > > > be required for all other hardware using this driver. I'd rather avoid that.
> > > > >
> > > >
> > > > In the case of the TI TPS3850, the minimum timeout is configurable, so
> > > > I didn't want to add a hard-coded value to the driver.
> > > >
> > > > > > Wouldn't be better to fix this without requiring a DT change and that
> > > > > > could work on stable kernels if needed.
> > > > > >
> > > > >
> > > > > Presumably that is some new hardware. Most of the watchdog drivers
> > > > > needing this value can derive it from the compatible property. The
> > > > > gpio watchdog driver is a bit different since it is supposed to work
> > > > > on a variety of hardware using gpio pins for watchdog control.
> > > > >
> > > >
> > > > Yes this is new hardware. This use case is also not very common as
> > > > most watchdog chips don't have this window function or a minimum
> > > > interval, at least in my experience, so I did not want to make it the
> > > > default for everything.
> > >
> > > Okay. However the existing property you copied has 2 problems. It uses
> > > underscores rather than hypens and doesn't use a standard unit suffix.
> > > So 'min-hw-margin-ms'.
> > >
> > > Though maybe a new property instead:
> > >
> > > timeout-range-ms = <min max>;
> > >
> > > That's somewhat aligned to 'timeout-sec', and IMO, clearer meaning than
> > > 'hw margin'.
> > >
> > > Rob
> > 
> > I agree that both the original property name and the new one aren't
> > great, but I didn't want to go changing the existing property for
> > everyone.  I could definitely add a new "timeout-range-ms" property -
> > should that be added in parallel to the original hw_margin_ms (i.e.
> > you can use one or the other), or completely replace the original?
> 
> I wonder how that made it in in the first place. Embarrassed ...
> of course it wasn't reviewed by a DT maintainer. I'd suggest to mark
> the old property as deprecated (if that is possible) and define
> the new one.

Seems doable. Only 1 user upstream.

Also, note that there is also 'rohm,hw-timeout-ms' which is a range.

Rob
