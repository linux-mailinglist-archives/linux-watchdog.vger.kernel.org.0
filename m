Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2D41C60D0
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 May 2020 21:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbgEETKB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 5 May 2020 15:10:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43916 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbgEETKB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 5 May 2020 15:10:01 -0400
Received: by mail-ot1-f66.google.com with SMTP id g14so2625280otg.10;
        Tue, 05 May 2020 12:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JrkhMCCoYOJladE4RVS52U6+dkFa/6a8TjFF7Rj2tSw=;
        b=Er5eryiI+Yh5wJwEIKU6Elnl7mTpOltf7ekfxKER0Hyo3ELA4lJJ87AjOveaWgiPsp
         4/aswFOnpndmdCILlnpYpM/g5/Lg+0Q4plgg5s+ssxj+oNKSXltbc5RWZ6UXNYCQNKB9
         uM1/jKmeLGnyFxVu3t8oW1zBWawYvHvIPUR8KkKMMZc2I87sfOGmCyOtWSGlNP/4qbYO
         1bXaAtQUqPnj5dzVDBbjUPh2mNrDsobaKPOQcyaxY/vQu+q819RE6cQVtpfHifPg28lf
         xFgvIS5PaJF7jZmsSZ5HhIJPXayhRg8Dt7hvOqx1dDAHvhVMYoN/IorWZoEaorcRY2le
         gqug==
X-Gm-Message-State: AGi0Pub4RbzOUcIK3+MAilCdCzNWaszFcocaVMv0gKl7jF+hn6T3e/P7
        NIOsqtNqLSIXZkoayFwijw==
X-Google-Smtp-Source: APiQypLf1GqQm6lCyCshIe6L3G/HFaTeyuJhQPwjq5atiVgTCoDtvkaGNSnRQ3I/HHv1kT5EjRsMrA==
X-Received: by 2002:a9d:2aa1:: with SMTP id e30mr3766752otb.364.1588705800005;
        Tue, 05 May 2020 12:10:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j137sm774893oih.23.2020.05.05.12.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 12:09:59 -0700 (PDT)
Received: (nullmailer pid 23415 invoked by uid 1000);
        Tue, 05 May 2020 19:09:58 -0000
Date:   Tue, 5 May 2020 14:09:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, jwerner@chromium.org,
        xingyu.chen@amlogic.com, Evan Benn <evanbenn@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: watchdog: Add ARM smc wdt for mt8173
 watchdog
Message-ID: <20200505190958.GA22997@bogus>
References: <20200505031331.122781-1-evanbenn@chromium.org>
 <20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200505131242.v6.1.Id96574f1f52479d7a2f3b866b8a0552ab8c03d7f@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue,  5 May 2020 13:13:30 +1000, Evan Benn wrote:
> This watchdog can be used on ARM systems with a Secure
> Monitor firmware to forward watchdog operations to
> firmware via a Secure Monitor Call.
> 
> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> 
> ---
> 
> Changes in v6:
> - Don't use dt default
> 
> Changes in v5:
> - Change compatible to arm,smc-wdt
> 
> Changes in v4:
> - Add arm,smc-id property
> 
> Changes in v3:
> - Change name back to arm
> 
> Changes in v2:
> - Change name arm > mt8173
> 
>  .../bindings/watchdog/arm-smc-wdt.yaml        | 37 +++++++++++++++++++
>  MAINTAINERS                                   |  6 +++
>  2 files changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/arm-smc-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
