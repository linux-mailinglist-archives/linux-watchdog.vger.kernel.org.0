Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120486173B3
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Nov 2022 02:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiKCBWI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Nov 2022 21:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiKCBWH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Nov 2022 21:22:07 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8ED12D25;
        Wed,  2 Nov 2022 18:22:07 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so221275otu.7;
        Wed, 02 Nov 2022 18:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hxkCgXWIO7LAznOkM0RbaSzWUPqOnXMUvHbW2mwLf5A=;
        b=Dwm3MRJj57OJLaaTswLhbIYvS3+5EEOOMibdkM2lvz/G3U13/fE6JdD8cJk1BSsvKS
         vTHna1pPaillnc+s6tbMmFto+6lu3nvYythLJAYn8YHe6/fS8qbrV+7KMA54Y35SMDRo
         4UW/7cxHMcPIHEuLesZqyfNBvk/mXad6DmoyKWWwDGkLrI2AUzeyyYueBOqoHEJSBa0a
         zBC6NgfP8IVLx3lMsBNIQanv5tqg/OcJOl4N0zeZ2/LDS3DJUUciXMzlVR6FLrwMyP/Q
         3ftnd798Lw7ypU6V3jq4LeCdla2HdZQpr34w9dCHJrYZtt2oLHo/grXfUhOlHPDZ4NW6
         ELBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxkCgXWIO7LAznOkM0RbaSzWUPqOnXMUvHbW2mwLf5A=;
        b=tSnzE7/+wZ/h1HaPiOssrRBW7TnleIzDM1rah2+PJTpljYcn/dfs3FJnrOUhwxNBdi
         z6bStB7TLgZci51DTZ4rMvcqi5d7zJ1vbyAjw3wa8qXbFl0zewaTLDeh9Ox9GR+ayNVm
         7OKo8khi8AhXAsCxCczoN/hKQBRNsPa4OWRJfggcNg1igutRhtaIPoMt8nVedsa5bScj
         EqwA1+AlCDP9+gsVt6r+93f1JYxXU1IlGmV6GMmp4c9Kww2Mm7uPHxeBu8pHGrmBp/Re
         ns84Wip3iBhTsQQq205rOB6TENEkC55U+t6gi120dWYv5GwXvK00CjQUeVlBdb0jiola
         MEfQ==
X-Gm-Message-State: ACrzQf3+NzGqwftnaRn5zs4+hN+ZzdUNUg6jcecf1v6szPrMNcwOtV2J
        nXHeXvFlsejdNy1gAYWMM+ZG3m7w3rQ=
X-Google-Smtp-Source: AMsMyM73mrLumHAm4ibKJBfgvncsVpEZuega4hEaal57+3JY7f7THNE5la4JgvMPi2WVNzdahgZ4wg==
X-Received: by 2002:a9d:630d:0:b0:66c:506d:e560 with SMTP id q13-20020a9d630d000000b0066c506de560mr10634930otk.40.1667438526581;
        Wed, 02 Nov 2022 18:22:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p5-20020a056870830500b0013b92b3ac64sm6777481oae.3.2022.11.02.18.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 18:22:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 2 Nov 2022 18:22:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v2] dt-bindings: watchdog: gpio: Convert bindings to YAML
Message-ID: <20221103012205.GA2109899@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Wed, Nov 02, 2022 at 11:05:30PM +0100, Marek Vasut wrote:
> Convert the gpio-wdt bindings from text to YAML ones, to permit DT validation.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: linux-watchdog@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Add missing required: properties
>     - Drop quotes around ref: referenced schema file name
> ---
> NOTE: The Maintainer entry should likely be changed, although it seems
>       like this driver and its matching bindings are now unmaintained.

I still can not parse this note. The MAINTAINERS entry for watchdog devices
includes

F:      Documentation/devicetree/bindings/watchdog/
F:      drivers/watchdog/

which should cover both the old and the new bindings as well as the driver.

Please explain.

Guenter
