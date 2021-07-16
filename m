Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678293CBC7F
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 Jul 2021 21:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbhGPTaE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 16 Jul 2021 15:30:04 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:42853 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbhGPTaD (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 16 Jul 2021 15:30:03 -0400
Received: by mail-il1-f174.google.com with SMTP id h3so9270575ilc.9;
        Fri, 16 Jul 2021 12:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nCCa1tLNJXzeSArcT0yifad2ojUsiDbTsWLIJKS/M5A=;
        b=WfDxepRCGHdQj6LVPEgbMkLBVrgQiri/T2IaQtclWsx63lSQQadRTPeEqb7YznGpfI
         R+EJe/McFxOcmnPVZyPiBrqxGzm4hUCnQBs2pIF1ARbmXegrJd16dcxcV2e79NEqkaL2
         KVAqcJ0ZdzU9ChONZX++yRfateiOByYw6LaeqMo4nppGltpki5LkvdqzXaeb4trrug+g
         lWXoZ+0awK0T4VPhxW74Zlik6JqDpeufHNCr1TGBraMt38rGuEHolGE+0kbzDNFN3Hxn
         K3oSbUJI/TFa7CdQ4B5S+o3K7Xh0kuMXjsfO4cw0hOQ6fJeZKSs2pqmzCphZISHTSm6o
         kK5w==
X-Gm-Message-State: AOAM531rbKeLWod26lr8HFtdndtfoNBeKqiH6RqEYhjjy9/TajCxbXaV
        /siUP8ptkvMvj21EA3ZlHA==
X-Google-Smtp-Source: ABdhPJwBh99OU+e3F2KSqRHFc/BD+J578gYIIt0WEUJW9WOpaEqW4j7ROAFjNpk2hufbUpHGqs+vQw==
X-Received: by 2002:a92:d391:: with SMTP id o17mr3093367ilo.214.1626463627488;
        Fri, 16 Jul 2021 12:27:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id e17sm4968411ilr.51.2021.07.16.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 12:27:06 -0700 (PDT)
Received: (nullmailer pid 3842733 invoked by uid 1000);
        Fri, 16 Jul 2021 19:27:05 -0000
Date:   Fri, 16 Jul 2021 13:27:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Add Maxim MAX63xx bindings
Message-ID: <20210716192705.GA3842693@robh.at.kernel.org>
References: <20210714153314.1004147-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714153314.1004147-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 14 Jul 2021 17:33:13 +0200, Linus Walleij wrote:
> This adds devicetree bindings for the Maxim MAX63xx watchdog
> timers.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/watchdog/maxim,max63xx.yaml      | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/maxim,max63xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
