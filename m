Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E80F556B8C3
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Jul 2022 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237352AbiGHLob (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Jul 2022 07:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237210AbiGHLoa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Jul 2022 07:44:30 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E727D1EF;
        Fri,  8 Jul 2022 04:44:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a15so23294194pfv.13;
        Fri, 08 Jul 2022 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VPrRxa68FujbOyWIy+nbWKmDhFvpvdqmf349Td24hyY=;
        b=WEsYsejYv/eOe/XvAvjN743Nd3qsu0ZtlRGueCuwPM/IygoqTI12LrJvxy4zO9lL3u
         OloQijFEx9EjQM4oFd3xPNLYSlON3ytbLgnWMosygC6Ek8Szia4W8QX/ZkqDt9/zcXzU
         Z3kqPx7nF4zIUlRBQsncXvdxx1OTlf2BMbxd5wFfRB70Xj99V9xV2dY2tB3/27DNAna5
         IhrqAvKGOWPteVDBCv+vvYC9Fh/xVZhsSbV0hHZmXy3hPYRrJc+Vokt0GtTYTYn8Cwm/
         X8OH+l8NhyuhydJSDkkvf1PSK9sWy+Dx7/sIxyx4DmR/Gs9w7AuWUrtYkIb+p0Ek2FJQ
         KMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VPrRxa68FujbOyWIy+nbWKmDhFvpvdqmf349Td24hyY=;
        b=BUXn2Lt0eTRKb+zchw0dsWVsrU+oZfYymXPPsbQUZ4PxKYjgXo08NTS+9MWRh7Im3y
         qtHT3Qjll8kYaHw5fhGOWEWpaTR6oHy6ttbKEH+R9Z0D7JLV+F9ib9oMea9WjkYa69RZ
         zboMBX7hcWiK7RPRMa3/PMPvkAJdiGI8fMxlvrEtDSQaTvmTelsGYlRkDlN/yEfHQi3W
         GTGdcezPrSH8IUZfjO2wqH+O2hoc+V1QcqoWypLC/Z7GteMIQPoHcreh5Ng744FSg3xm
         K9q5FAoyahuOiG8Mq63h3z42IoSh1sMaq70jBwZk+M9QOBoqHFJSoks5E2tY8NdM8gwQ
         Ck2A==
X-Gm-Message-State: AJIora/WkTmG2MO3ma6MsDSzMEUUjxr3Ld5rt+5qpy6x1GrYYx2k9mhy
        6vZIs1MG476Xfy5TmpJhy1s=
X-Google-Smtp-Source: AGRyM1tf3kmLSQJLfrcJN4WDoHVHwhoH/ShT7xyCk2GLhMD7iDPqJtdeLKao2b3TuvTuWxnDCm0peQ==
X-Received: by 2002:a63:1a26:0:b0:412:434a:48fc with SMTP id a38-20020a631a26000000b00412434a48fcmr2915090pga.623.1657280668060;
        Fri, 08 Jul 2022 04:44:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3-20020aa78f03000000b005289de8abe2sm2503646pfr.85.2022.07.08.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 04:44:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Jul 2022 04:44:25 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Isaac True <isaac.true@canonical.com>
Cc:     Rob Herring <robh@kernel.org>, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH 2/2] watchdog: gpio: add configurable minimum interval
Message-ID: <20220708114425.GA2164221@roeck-us.net>
References: <20220629110626.2158127-1-isaac.true@canonical.com>
 <20220629110626.2158127-2-isaac.true@canonical.com>
 <20220701171829.GA1149706-robh@kernel.org>
 <0d045bb8-a519-39d4-17fa-123f90969bd9@roeck-us.net>
 <CALkPoPYKNxAeP6HM1cMh1zzW6jw4fktCp42b7+79Qf8DVJis-w@mail.gmail.com>
 <20220705195614.GA2503171-robh@kernel.org>
 <CALkPoPY49PGNk84spUF3BesdZoUFpq++D1NYd_1ouT2Cv4wDYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALkPoPY49PGNk84spUF3BesdZoUFpq++D1NYd_1ouT2Cv4wDYQ@mail.gmail.com>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jul 07, 2022 at 11:00:45AM +0200, Isaac True wrote:
> On Tue, 5 Jul 2022 at 21:56, Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Jul 04, 2022 at 01:05:04PM +0200, Isaac True wrote:
> > > On Fri, 1 Jul 2022 at 19:48, Guenter Roeck <linux@roeck-us.net> wrote:
> > > >
> > > > On 7/1/22 10:18, Rob Herring wrote:
> > > > > On Wed, Jun 29, 2022 at 01:06:26PM +0200, Isaac True wrote:
> > > > >> Add the "min_hw_margin_ms" parameter to gpio_wdt devices, allowing a
> > > > >> minimum interval to be specified, stopping watchdog devices from being
> > > > >> fed too quickly if they require a certain interval between feeds.
> > > > >
> > > > > I assume there is some real platform with a real problem you are trying
> > > > > to solve? Details please.
> > > > >
> > > >
> > > > Agreed, this should be explained in more detail.
> > >
> > > Yes this is a real platform using a TI TPS3850 watchdog chip. With
> > > this chip you can configure a "window" which can detect early faults
> > > (i.e. too frequent) in addition to the standard watchdog features. I
> > > needed to add this minimum timeout to avoid watchdog resets in
> > > situations such as where first U-Boot and then the Linux kernel feed
> > > the watchdog with too short of an interval between them, or when
> > > systemd was configured to use the watchdog device and was feeding it
> > > too soon after taking over from the kernel.
> > >
> > > > > Can you just hardcode some min? Maybe 10% of the max or something. Is
> > > > > there a downside to a larger than necessary min?
> > > > >
> > > >
> > > > That would result in extra overhead in the watchdog core which would not
> > > > be required for all other hardware using this driver. I'd rather avoid that.
> > > >
> > >
> > > In the case of the TI TPS3850, the minimum timeout is configurable, so
> > > I didn't want to add a hard-coded value to the driver.
> > >
> > > > > Wouldn't be better to fix this without requiring a DT change and that
> > > > > could work on stable kernels if needed.
> > > > >
> > > >
> > > > Presumably that is some new hardware. Most of the watchdog drivers
> > > > needing this value can derive it from the compatible property. The
> > > > gpio watchdog driver is a bit different since it is supposed to work
> > > > on a variety of hardware using gpio pins for watchdog control.
> > > >
> > >
> > > Yes this is new hardware. This use case is also not very common as
> > > most watchdog chips don't have this window function or a minimum
> > > interval, at least in my experience, so I did not want to make it the
> > > default for everything.
> >
> > Okay. However the existing property you copied has 2 problems. It uses
> > underscores rather than hypens and doesn't use a standard unit suffix.
> > So 'min-hw-margin-ms'.
> >
> > Though maybe a new property instead:
> >
> > timeout-range-ms = <min max>;
> >
> > That's somewhat aligned to 'timeout-sec', and IMO, clearer meaning than
> > 'hw margin'.
> >
> > Rob
> 
> I agree that both the original property name and the new one aren't
> great, but I didn't want to go changing the existing property for
> everyone.  I could definitely add a new "timeout-range-ms" property -
> should that be added in parallel to the original hw_margin_ms (i.e.
> you can use one or the other), or completely replace the original?

I wonder how that made it in in the first place. Embarrassed ...
of course it wasn't reviewed by a DT maintainer. I'd suggest to mark
the old property as deprecated (if that is possible) and define
the new one.

Guenter
