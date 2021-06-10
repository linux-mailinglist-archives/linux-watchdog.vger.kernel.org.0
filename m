Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C263A318D
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Jun 2021 18:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231560AbhFJQ7Y (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 10 Jun 2021 12:59:24 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41653 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhFJQ7Y (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 10 Jun 2021 12:59:24 -0400
Received: by mail-ot1-f45.google.com with SMTP id 36-20020a9d0ba70000b02902e0a0a8fe36so337514oth.8;
        Thu, 10 Jun 2021 09:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rpk9mMadMlubIUupImrRcIPYmdZMWvf9CrNUh5GvfhY=;
        b=uKi0O1AIVCS64vo42XmlcuQ0GE3WaNeTjC1UazN4VeuiqRdaCy3zcsvhMe5QtCEMDa
         ty3vkm/rCWFdxEEmY286IjEr3YaJydAvfjGNI+iMfvPDUuxckWa9T1z0I3DL65AId1rg
         daXnaJu3rJOeEwh9mGh4XtwaYVl8wmVaYH3si4XMLgXRkRzyPfCu73OvhrXQvE48A2OM
         cOoCzyTL98/vPX85R3SF7pu010rOAamPSZ1S9NwevrdSsi2ohpFM71Pp5xRBWdBBrAq8
         QFAraHJowd5X6RFPkGNUjp8ylKolomxFm84j4F27/spa2lzn+H23ZNzh2KlOPltN21Bu
         +BzA==
X-Gm-Message-State: AOAM531rEPP8g+IyYAqrLhtdqHSdRcAZgrWJml3Wm5y/LB88pB7nernZ
        G4KR7fgXFFXXvu39TXnw8Q==
X-Google-Smtp-Source: ABdhPJxkWeRbLMG1xLRqP6wAwGiOrxpRQmlxtncpjCzdTkcurSxgutw59zEEym37ZvGzNwyHCQmHew==
X-Received: by 2002:a05:6830:3147:: with SMTP id c7mr2757649ots.332.1623344231343;
        Thu, 10 Jun 2021 09:57:11 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
        by smtp.gmail.com with ESMTPSA id z6sm670609oiz.39.2021.06.10.09.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 09:57:10 -0700 (PDT)
Received: (nullmailer pid 1960841 invoked by uid 1000);
        Thu, 10 Jun 2021 16:57:02 -0000
Date:   Thu, 10 Jun 2021 11:57:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Romain Perier <romain.perier@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Daniel Palmer <daniel@0x0f.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-kernel@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: watchdog: Add Mstar MSC313e WDT
 devicetree bindings documentation
Message-ID: <20210610165702.GA1960781@robh.at.kernel.org>
References: <20210605170441.33667-1-romain.perier@gmail.com>
 <20210605170441.33667-2-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210605170441.33667-2-romain.perier@gmail.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, 05 Jun 2021 19:04:39 +0200, Romain Perier wrote:
> This adds the documentation for the devicetree bindings of the Mstar
> MSC313e watchdog driver, found from MSC313e SoCs and newer.
> 
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> ---
>  .../bindings/watchdog/mstar,msc313e-wdt.yaml  | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mstar,msc313e-wdt.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
