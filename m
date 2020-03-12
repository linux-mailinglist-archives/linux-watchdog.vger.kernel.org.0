Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5255183C4D
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Mar 2020 23:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgCLWWF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 12 Mar 2020 18:22:05 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36726 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgCLWWF (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 12 Mar 2020 18:22:05 -0400
Received: by mail-oi1-f194.google.com with SMTP id k18so7282984oib.3;
        Thu, 12 Mar 2020 15:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OsTug+wFPYvu1dsEP+HjJTVY8zFYC98KWDkMm6y/bAM=;
        b=Q/34E52L5C2ETz37DXsW+OokQGk6gUzXI4rferXXtbhguw3iL/oGUTC/OHmxFhGg4v
         2rKLKcopkbKD0AmcBHU2fR9stX3WV7jjY07kBpIZn/EqTKSancu9okcZiEFiFFgszjZx
         6MP7K83fw22aLFUvxCDiRHoJvSv6hQ2qBR3KyamLyqP8LhPyyf3OQlwykDqA+zYTQdIW
         +D9Gwv0Jca/O+QTnNdyow03ctkKCgUGqX+sODAYl2Ht9Xjztksikuco2zG7Omqvsww7V
         BXUjxDX+JH67zHxL5nemWpfSbZiXIDY7iWs0DyVd02Cg4Dj5EXifZO/C/mD3uoh2Ajs8
         mIoA==
X-Gm-Message-State: ANhLgQ34MTr9zdN4OknHjVhmW8OrqJerDZPdetbn7C0fmkKlPzAUtscf
        MReApFmOo/2btsbsMp79xg==
X-Google-Smtp-Source: ADFU+vt7wLxkZF+SNDSBgEsIFB/+M2Ofk3SegkM60wYe0M9i2VazpAmQDww4IoWy/Oa5AfmBoQ1EQQ==
X-Received: by 2002:aca:cdcd:: with SMTP id d196mr4574031oig.16.1584051724248;
        Thu, 12 Mar 2020 15:22:04 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k101sm9796724otk.6.2020.03.12.15.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 15:22:03 -0700 (PDT)
Received: (nullmailer pid 19309 invoked by uid 1000);
        Thu, 12 Mar 2020 22:22:02 -0000
Date:   Thu, 12 Mar 2020 17:22:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sergey.Semin@baikalelectronics.ru
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs
 array property
Message-ID: <20200312222202.GA19251@bogus>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132818.98D7F80307C2@mail.baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306132818.98D7F80307C2@mail.baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, 6 Mar 2020 16:27:42 +0300, <Sergey.Semin@baikalelectronics.ru> wrote:
> From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
> a custom timeout periods are used to preset the timer counter. In
> this case that periods should be specified in a new "snps,watchdog-tops"
> property of the DW watchdog dts node.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  .../bindings/watchdog/snps,dw-wdt.yaml        | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
