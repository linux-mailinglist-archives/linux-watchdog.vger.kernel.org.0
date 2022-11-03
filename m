Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C10D61860A
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 18:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbiKCRUm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Nov 2022 13:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231411AbiKCRUj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Nov 2022 13:20:39 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1400721A0;
        Thu,  3 Nov 2022 10:20:39 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1322d768ba7so2924768fac.5;
        Thu, 03 Nov 2022 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThmpJLvFBnJUOUuV8xIq28ewDFOqcv8m+/fml5LGVqU=;
        b=mMcvsu4sZbM9PzXkyXplhM9atEnm5CWENuTU80LnQskeXOFCzvKAMtYwMLcGb2luAf
         XjA5uBbB8kK7DSWuz9g76yxgR5Kjp/ALXDs7je458XB4m4p1RGcXtR6k0q8JYwWUwx0i
         SyjauAqaZiaIzBxNOPi1tI8Y8Xlfym6wYdjQRSkWJG81koDsFbhlzwrZdMyHgV/0KxPl
         qgV1c8ZPMnI/9D3928hMIBdFcJh6ENE6TM+nZlcdErz7vYbxvZOgvVVHsjnJK2KDFLpm
         CRvAveIStkeGXVpfXHtg2m3vLq2U4+I4mVbNqFxzYNmNlCsXskBJke0xNT5La8ZX/JDu
         yOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThmpJLvFBnJUOUuV8xIq28ewDFOqcv8m+/fml5LGVqU=;
        b=onuDxZWRf65kB8EzZT5y2M29MN41kZbA9DhNnwYXjW6DWBLE7/rympprzJ06r//R1+
         orCmiAfFU3cpQqOpqnMqbBm5/ITrNsM9WSDWVTyjnjqu8GcGnCuZVIREvzn/FLkjFfnV
         jTgrSf1hL26qh/P96s/tQGn/YMOxY1ecTn57O/jmZcMGDloXEHq3TG+gAlfeEAmWlBQk
         PnOHQ2tfo8Xp/n7dr7QyySHJccAWP4CcK9cCPM28Enid7KNT9FITXuskZhEqcqgStSKk
         KNsGrCTOOXu1KwkLcGlImNxMEnpYUGj5X6qs/+NXz6BGK2kOrJOkIKW9qk+Y6Idnwjac
         nf8g==
X-Gm-Message-State: ACrzQf2j1jk9VaTUuIqdBN/niJlhlIxHt0BHELP6D5RJcbv3NjzistXR
        Mu0pZO3pspRMY2HEM7p8BIn5ZYfBPHE=
X-Google-Smtp-Source: AMsMyM4l100qVZIo+bSYr55dDklj6IXLLtC7fo1YGRUypxAqqasT+Tte2yr8ZcIatUlNnMIBKSpXqA==
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id ba11-20020a056870c58b00b0010bd21dad5emr19008788oab.287.1667496038382;
        Thu, 03 Nov 2022 10:20:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x19-20020a056808145300b0034fc91dbd7bsm603441oiv.58.2022.11.03.10.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 10:20:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Nov 2022 10:20:20 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <20221103172020.GA177861@roeck-us.net>
References: <20221103012205.GA2109899@roeck-us.net>
 <a7db27cb-bb50-ed13-f2b7-54a8f66b1b97@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7db27cb-bb50-ed13-f2b7-54a8f66b1b97@denx.de>
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 03, 2022 at 05:31:12PM +0100, Marek Vasut wrote:
> On 11/3/22 02:22, Guenter Roeck wrote:
> > On Wed, Nov 02, 2022 at 11:05:30PM +0100, Marek Vasut wrote:
> > > Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Guenter Roeck <linux@roeck-us.net>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> > > Cc: linux-watchdog@vger.kernel.org
> > > To: devicetree@vger.kernel.org
> > > ---
> > > V2: - Add missing required: properties
> > >      - Drop quotes around ref: referenced schema file name
> > > ---
> > > NOTE: The Maintainer entry should likely be changed, although it seems
> > >        like this driver and its matching bindings are now unmaintained.
> > 
> > I still can not parse this note. The MAINTAINERS entry for watchdog devices
> > includes
> > 
> > F:      Documentation/devicetree/bindings/watchdog/
> > F:      drivers/watchdog/
> > 
> > which should cover both the old and the new bindings as well as the driver.
> > 
> > Please explain.
> 
> I don't mind placing you and Wim into the yaml DT maintainer section if
> that's OK with you ?

Ah, you mean the _yaml_ Maintainer entry. Just add me; I can not make
the call for Wim.

Guenter
