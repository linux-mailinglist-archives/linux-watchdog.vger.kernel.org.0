Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E3239C272
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Jun 2021 23:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFDVdF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 4 Jun 2021 17:33:05 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:34466 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhFDVdE (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 4 Jun 2021 17:33:04 -0400
Received: by mail-oi1-f176.google.com with SMTP id u11so11138450oiv.1;
        Fri, 04 Jun 2021 14:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G8/6uPjm9zIO07Og3jk4Blee6TytpfNx97cozFtQkXk=;
        b=sNvHJTfESGpwISCwgWdw1GXP8cRAmtJVzaqx5z3vImYp3ffMh80MNlmPanWSewCEJj
         8U8yoCl/OC/tDc+CMUe44Sz6bZTwGz7pM2+crzq3HsBNttY2GTfU98hgBLcLkoQdoF/V
         4GOiQfkTULljduLwnhvWzIpnKqz99AvzvNSQxrz6vrVQSEHWSudhqTi3pDs3oIeGLqI+
         0hSZ2vJ5/qlPrnZbnLHdzovly2qbrR+XxCP9qz8XVkJUVRGXC5BHBkIMICCu6kqaupLm
         BOqQU2i0DXG48+onr/kJpq5Lfg/89IgtdKKx8tacCQhdj81scASbe+Yld+NJruacM4S4
         30VQ==
X-Gm-Message-State: AOAM531tD4HrF8f7Hf1p/fxo0hvJCjjZnWhtklq1xtOeJYxcLZhiiKpm
        +2wo6gciNnhmO9A9cpVZTg==
X-Google-Smtp-Source: ABdhPJwt9RTOBE4geRHCniJZTQYsmuFJN2nxYT9C6QTFn0LP/lZgvq3IYcVDxInRaeGmlUib3nIgRQ==
X-Received: by 2002:aca:32d5:: with SMTP id y204mr4299396oiy.97.1622842265997;
        Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p25sm667895ood.4.2021.06.04.14.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:31:05 -0700 (PDT)
Received: (nullmailer pid 3955311 invoked by uid 1000);
        Fri, 04 Jun 2021 21:31:04 -0000
Date:   Fri, 4 Jun 2021 16:31:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, soc@kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        Olof Johansson <olof@lixom.net>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Ray Jui <rjui@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] dt-bindings: arm: bcm2835: Add Raspberry Pi 400 to
 DT schema
Message-ID: <20210604213104.GA3955259@robh.at.kernel.org>
References: <1622366775-5309-1-git-send-email-stefan.wahren@i2se.com>
 <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622366775-5309-5-git-send-email-stefan.wahren@i2se.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, 30 May 2021 11:26:13 +0200, Stefan Wahren wrote:
> Add new Raspberry Pi 400 to DT schema.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
