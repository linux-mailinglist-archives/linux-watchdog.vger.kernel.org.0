Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C743F4353FA
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Oct 2021 21:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhJTTq2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Oct 2021 15:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhJTTq1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Oct 2021 15:46:27 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4505AC06161C;
        Wed, 20 Oct 2021 12:44:13 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so7476011otb.1;
        Wed, 20 Oct 2021 12:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BnN9MIlNnNEHe3vFSBOy65YT0/zTtejLPjp21ON54XM=;
        b=f9nQVf2giN3wJxDfbtUTUJkqnEgsHMIAhBRDKRgfJmWICvBJUySo5eN6lnLB1C2bOv
         EbKO8rhhnyUcWl6uPXB1xydamDaueXTZvJieRoImRhKYleEoNuO2i4hBfgubF6inUk88
         e+WopyjhmntiepwIvBu/NI8RqXLYv7gNRN6+nVhmrun35wEBIzQCX1GR9d7g41ZoSZDa
         u4QZqMKaf9hcjRpDou18NtIyrfp5ZlLGSeWvFppe/nUPlYTAMZhWQmqxtHrNJu16VdVI
         L3i2YP7hw+kDpo9zthUb7MSdenqBciY52p4F9VkV6IfHxIcElZl02oZQw3EfiYGVvwVF
         R71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=BnN9MIlNnNEHe3vFSBOy65YT0/zTtejLPjp21ON54XM=;
        b=P6XqZ0fq2v1zSyThJwiTCQ0JAm2MfDMEGtAyVz5pmKuukD3weHZd0F7wq8e6eicYYL
         blx2W/3fSPybgOb224NriEDGOraMdiBjcGrUVLeB/ZPaj4CvYRX21l3XFaVXqHudSqnt
         CIlS4/zfTIt5j35xAmCe7RxaRRNIKjv5BYOiRw5wUecnXMrkgKnJvFRlv8r7VbFfrwi6
         P1GeXTq1vZ/BNe5hpt2z6q8YN/99YXLPphEG7h1IbSt4uBR28UY5xmsF6p09g0Z+Oh0k
         wtVbBx17HpvdHN5uTr4lHrdqCK+P7AfhYUTd/8nyRhmGrCHn3GrXSQhxYIKdBUkhk+kt
         GxPw==
X-Gm-Message-State: AOAM5327/+4aZ2e4jlbQcT04JCYZknCFbBoF4h4MkyUd6vvgASPEMrmU
        7DazPUhiN/EQLJCcGRLA5M0=
X-Google-Smtp-Source: ABdhPJxL4kBEQ8gUV5nBs+kclyHcheCDaeGr/7iHXTpx9JD+NbtcFCTZWeb2l9Q5LpNao1cSG01V2A==
X-Received: by 2002:a9d:63ca:: with SMTP id e10mr1015031otl.175.1634759052687;
        Wed, 20 Oct 2021 12:44:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w69sm642977otb.16.2021.10.20.12.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:44:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 20 Oct 2021 12:44:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>,
        "Javier S . Pedro" <debbugs@javispedro.com>
Subject: Re: [PATCH] Revert "watchdog: iTCO_wdt: Account for rebooting on
 second timeout"
Message-ID: <20211020194408.GA2882870@roeck-us.net>
References: <20211008003302.1461733-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008003302.1461733-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Wim,

On Thu, Oct 07, 2021 at 05:33:02PM -0700, Guenter Roeck wrote:
> This reverts commit cb011044e34c ("watchdog: iTCO_wdt: Account for
> rebooting on second timeout") and commit aec42642d91f ("watchdog: iTCO_wdt:
> Fix detection of SMI-off case") since those patches cause a regression
> on certain boards (https://bugzilla.kernel.org/show_bug.cgi?id=213809).
> 
> While this revert may result in some boards to only reset after twice
> the configured timeout value, that is still better than a watchdog reset
> after half the configured value.
> 
> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
> Fixes: aec42642d91f ("watchdog: iTCO_wdt: Fix detection of SMI-off case")
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Mantas Mikulėnas <grawity@gmail.com>
> Reported-by: Javier S. Pedro <debbugs@javispedro.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Any chance you can send a pull request with this patch prior to the v5.15
release ?

Thanks,
Guenter
