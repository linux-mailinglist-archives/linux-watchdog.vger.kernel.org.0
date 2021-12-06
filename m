Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277594691EF
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Dec 2021 10:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239898AbhLFJI5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Dec 2021 04:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239930AbhLFJI4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Dec 2021 04:08:56 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35211C061354
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Dec 2021 01:05:28 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id j3so20977902wrp.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Dec 2021 01:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pWd7HE9hhaSv+KO6WVDhmPYoVmXY0lrwRq3TXIg8rXw=;
        b=uKZK1bjTKIw/U0j5Lvv8cDb7MSK1seDvYg9wC5T2ot4QAcS8KmJd4fYyGPhRdoa+WE
         ICL787Nl4IeLkQribg8XBxSBadlxEpzSu4l7G5NVDTDIpj0H5zY1xxmvt8Tdpb+pbYQA
         RzbR/lJXLb/LPPEUXD8i57DfbJEDSbn1J8m9Mzt6Qhd0h0Ut/nBuqf3iixowUb8r4uMK
         1I09T/Jnod89Eek+QPazgV53CjZd1t/3AiNaRml5QWighz1VejuZMYPZUhyuIy8+VPjQ
         1hwno2/uPS3afMuWLw53LQ4uThHaZO3oqBGaXewWHauFlAYPJrWLRV5pEfWNBDSf10Di
         kUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pWd7HE9hhaSv+KO6WVDhmPYoVmXY0lrwRq3TXIg8rXw=;
        b=afpodLl0eFUd4bWxE1Aokh7BYIihX1eH+StxLqKZVBs0byOYPeZHcp4eKz7k8xXNmu
         8XiG3Yh6/ijaU4wPpF2BMv2z39mpDycaFSHe6KQI5BpAwV+FwCp/h/cDeLTMC7+12MBA
         GR/77a9Mw+T5RY+pl35IQ+EuI3bf34/Dzfn66GDB6zzYvnKQuhBjUYr9HByihGykSd5g
         g0G6H+U/+wvNFnUDsUbBcHO6PqbuwDaPWhsDdPIFgnlHKK0bqtV5dj5JP0+cVvOC3JVI
         bSLqmQ2yvwv0wvEo8s8N3MxMrOm42rm5R++vwIQArFnYIlQJhD3vDc+ILGaYMlnnu1Gx
         Ua6A==
X-Gm-Message-State: AOAM530NpfgL4UJF2Rnf8fVytUidxG2XQVBSf/fuIRVg8HrQbbcRBd7Q
        X89Y/ruJmsj+7OF7Fx3QLrs64Q==
X-Google-Smtp-Source: ABdhPJxQ2tEemasO3ShP6tbS+DqGm4T825352zkZkKi/LemD3UaDC0FNbK9qAQ9bnbWgybnhys2MCw==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr42173907wri.69.1638781526553;
        Mon, 06 Dec 2021 01:05:26 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id n32sm10075259wms.42.2021.12.06.01.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 01:05:26 -0800 (PST)
Date:   Mon, 6 Dec 2021 09:05:23 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <Ya3SU6U6YT6mlFu8@google.com>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, 06 Dec 2021, Rafał Miłecki wrote:

> On 06.12.2021 09:44, Lee Jones wrote:
> > On Mon, 06 Dec 2021, Rafał Miłecki wrote:
> > > On 15.11.2021 06:53, Rafał Miłecki wrote:
> > > > From: Rafał Miłecki <rafal@milecki.pl>
> > > > 
> > > > This helps validating DTS files.
> > > > 
> > > > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > > > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > 
> > > I'm not familiar with handling multi-subsystem patchsets (here: watchdog
> > > & MFD).
> > > 
> > > Please kindly let me know: how to proceed with this patchset now to get
> > > it queued for Linus?
> > 
> > What is the requirement for these to be merged together?
> 
> If you merge 2/2 without 1/2 then people running "make dt_binding_check"
> may see 1 extra warning until both patches meet in Linus's tree.
> 
> So it all comes to how much you care about amount of warnings produced
> by "dt_binding_check".

In -next, I don't, but I know Rob gets excited about it.

Rob, what is your final word on this?  Is it a forced requirement for
all interconnected document changes to go in together?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
