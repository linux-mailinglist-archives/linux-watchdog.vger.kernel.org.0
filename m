Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27AE34B83E
	for <lists+linux-watchdog@lfdr.de>; Sat, 27 Mar 2021 17:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhC0QkE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 27 Mar 2021 12:40:04 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:33386 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhC0Qjo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 27 Mar 2021 12:39:44 -0400
Received: by mail-ot1-f54.google.com with SMTP id s11-20020a056830124bb029021bb3524ebeso8251379otp.0;
        Sat, 27 Mar 2021 09:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=slhgr6hw24BbRJVfvz1417ZaHRih1z35mJAzQg49R8Q=;
        b=ptG160iRrf9Ic5qBVX1KxSd8+H5eg3VrOJgLpbP+vqCO3cYXzQ6eawk/cZCqfJVClW
         tdAqHyJy87w9U9JBEw/cM+Mf6vYhGMKEq83LqzxZ5gqnQzoatqdQyGYFv3p+iCcNWRzl
         vEE3/8YQire5DlKK92iNL2oaHo/UDA7OivoBbj1iSuVFm53MRwSEE3jNJ8R1+P/b++1F
         q4PgWQcn7Tbp2EhhzCp/HWV6Q3yaYM8tQJxCQ3uAmX/iePtF8Y4f5o1JzXaAGh/5cWdS
         oMk2bMzOwXbLksbDDS7QSUUZkNO52QbiPg+jPYWgxWhHi/L5jbekEgDM2mBMoxnPokXb
         YMdw==
X-Gm-Message-State: AOAM530KmSfEyYsULSqAvqWzXBt3aJdU2OOAoF1sMzJZxqg1f9Yg+2o/
        T/wfish1GBY86sd0cl+qMQ==
X-Google-Smtp-Source: ABdhPJxQjloklyUslrbUHzJCVse7QmDNkKO884rNpGP+vLsKmHJnuNbHWCAqy30qFKU/CySEHFNduw==
X-Received: by 2002:a9d:3b0a:: with SMTP id z10mr16282117otb.326.1616863183754;
        Sat, 27 Mar 2021 09:39:43 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
        by smtp.gmail.com with ESMTPSA id m126sm2484503oig.31.2021.03.27.09.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 09:39:43 -0700 (PDT)
Received: (nullmailer pid 215898 invoked by uid 1000);
        Sat, 27 Mar 2021 16:39:37 -0000
Date:   Sat, 27 Mar 2021 10:39:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-kernel@vger.kernel.org, Patrick Venture <venture@google.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        openbmc@lists.ozlabs.org, Nancy Yuen <yuenn@google.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        Avi Fishman <avifishman70@gmail.com>
Subject: Re: [PATCH 06/14] dt-bindings: watchdog: npcm: Add
 nuvoton,wpcm450-wdt
Message-ID: <20210327163937.GA215847@robh.at.kernel.org>
References: <20210320181610.680870-1-j.neuschaefer@gmx.net>
 <20210320181610.680870-7-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210320181610.680870-7-j.neuschaefer@gmx.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, 20 Mar 2021 19:16:02 +0100, Jonathan Neuschäfer wrote:
> Add a compatible string for the WPCM450 SoC, which has the same watchdog
> timer.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  .../devicetree/bindings/watchdog/nuvoton,npcm-wdt.txt          | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
