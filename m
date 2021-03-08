Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F243311B8
	for <lists+linux-watchdog@lfdr.de>; Mon,  8 Mar 2021 16:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhCHPKW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 8 Mar 2021 10:10:22 -0500
Received: from mail-lj1-f176.google.com ([209.85.208.176]:39522 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230521AbhCHPJw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 8 Mar 2021 10:09:52 -0500
Received: by mail-lj1-f176.google.com with SMTP id u4so16513260ljh.6;
        Mon, 08 Mar 2021 07:09:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=qDFO2q7qebrjLJVXjNGTZ5/gKgEyAn+bBHMsQajnxSM=;
        b=P5FEd/K8CTSozotUaIQJAg1S8hoV5tXlNz5AmbQCX2LICemRD5R2B1jRSXSyqQKIla
         iHH84vDVoIHcGGoo6y/Sbt0vK2bOkShWPVzdmdMzRGpjQV4oKKfoYSySrWMyLr3uNvWA
         6LDPvHMu0fjL3xWwuRPtm7BwP69NSFj5jO3KEFMa6WGcTRDkw65ufzY/bdFOV2vEM+cV
         Fdd+0zstO4XvfN8sfDr3P+74gQEmKS2RrIHiLgGhsZ7Sghfe2s93M/VC67rzVqrxpIbl
         B5jO2cX9iR4Cq93UQMej396BQNAK/XqDHJrQic51wBq0PzZuJMiFJApGdmajC7eZoeo4
         iN/w==
X-Gm-Message-State: AOAM531tAapAeaXclZWOvDo+xIym5hw4KUQPP6Gi7SjKU53MXWwKyu6N
        H1sSzznPWiTXqOJPkgRD+40=
X-Google-Smtp-Source: ABdhPJyJ3B9QojYmfeh1yu7IMQNt8EupiE76uAJokvkQD5dsRsyp8dCPQsuPTlrDyxT3kcixQ0eUgQ==
X-Received: by 2002:a2e:8283:: with SMTP id y3mr9215569ljg.422.1615216190857;
        Mon, 08 Mar 2021 07:09:50 -0800 (PST)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id e11sm818155ljj.59.2021.03.08.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 07:09:50 -0800 (PST)
Message-ID: <84b54b6c741fec920f26fc47890da40bf25cae49.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v8 6/6] mfd: bd9576: Add safety limit/monitoring
 registers
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-watchdog@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210308134716.GF4931@dell>
References: <cover.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
         <f9d76bed70a440036b56be8a0928925d12db8463.1613031055.git.matti.vaittinen@fi.rohmeurope.com>
         <20210308134716.GF4931@dell>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Mon, 08 Mar 2021 17:09:45 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


On Mon, 2021-03-08 at 13:47 +0000, Lee Jones wrote:
> On Thu, 11 Feb 2021, Matti Vaittinen wrote:
> 
> > ROHM BD9576 contains safety features like over/under voltage
> > detection,
> > over curren detection and over temperature detection. Add the
> > configuration register information.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > 
> > Changes since v7:
> > 	New patch
> > 
> >  include/linux/mfd/rohm-bd957x.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/include/linux/mfd/rohm-bd957x.h
> > b/include/linux/mfd/rohm-bd957x.h
> > index 3f351a1ae4ab..2bd35260ee8e 100644
> > --- a/include/linux/mfd/rohm-bd957x.h
> > +++ b/include/linux/mfd/rohm-bd957x.h
> > @@ -116,6 +116,25 @@ enum {
> >  #define BD957X_REG_VOUT4_TUNE		0x59
> >  #define BD957X_REG_VOUTL1_TUNE		0x5c
> >  
> > +#define BD9576_REG_VOUT1_OVD		0x51
> > +#define BD9576_REG_VOUT1_UVD		0x52
> > +#define BD9576_REG_VOUT2_OVD		0x54
> > +#define BD9576_REG_VOUT2_UVD		0x55
> > +#define BD9576_REG_VOUT3_OVD		0x57
> > +#define BD9576_REG_VOUT3_UVD		0x58
> > +#define BD9576_REG_VOUT4_OVD		0x5a
> > +#define BD9576_REG_VOUT4_UVD		0x5b
> > +#define BD9576_REG_VOUTL1_OVD		0x5d
> > +#define BD9576_REG_VOUTL1_UVD		0x5e
> > +
> > +#define BD9576_MASK_XVD			0x7f
> > +
> > +#define BD9576_REG_VOUT1S_OCW		0x5f
> > +#define BD9576_REG_VOUT1S_OCP		0x60
> > +
> > +#define BD9576_MASK_VOUT1S_OCW		0x3f
> > +#define BD9576_MASK_VOUT1S_OCP		0x3f
> 
> Just a quick check, are these meant to be the same value?

Thanks for the check. They are both same value.

> 
> If so:
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
Thanks, I'll add your ack.

Best Regards
	Matti

