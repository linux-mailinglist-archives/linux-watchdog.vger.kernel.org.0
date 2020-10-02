Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D4E2817F3
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Oct 2020 18:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgJBQb3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Oct 2020 12:31:29 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39715 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387768AbgJBQb3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Oct 2020 12:31:29 -0400
Received: by mail-ed1-f66.google.com with SMTP id g3so2273844edu.6;
        Fri, 02 Oct 2020 09:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ob6yBTxTvpF+NmnLYuQkF0QwiwVMT5Xln9UbGMFpmVs=;
        b=nBNb3eNIVPv4tQ+oXXLQ2k6Woyx/ZRhGJDg7iOFcO036aUHj5+yr6YSChcyiDIquDl
         Cs23ybLz3WRgW+LMaRu0oKPyjB7VdG49AaxJgGzN6O120bc+X+Z3BKHlL7zJ6pzwBVEP
         QnYOxdRVkKJ5aqJrpD4wkHDhnS0FGyy8/EkTsnzV4axKFdwW0rCyYiSC3oGYDa89coS3
         AUunjyWsY/3GcJfqsEH5V8XwexvV7EPJZHFDZxerun4Okf38l0Jifj/YPwVw9m+pqCam
         refC3SJwqulf7c50oC5AEhLwWGxpdILrtyThxV78izOd0mWyO5tdvgrlqFPb1gHPQrhi
         hBjQ==
X-Gm-Message-State: AOAM532yH+aue5suJt0BjvmCeSVA5Zx1oIbLFJgSto4fq4oIfeDJAODx
        VlhPLX3caspBcUzhgXYfthVpBjp0N31/HA==
X-Google-Smtp-Source: ABdhPJxj/04SdAVL8johRyiS8Accn/yYhhz15vdyCNEshtRGEwl4D9CZVuhofzWTRmFnHuib6CKwCA==
X-Received: by 2002:a50:ccc6:: with SMTP id b6mr3219690edj.329.1601656287360;
        Fri, 02 Oct 2020 09:31:27 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
        by smtp.googlemail.com with ESMTPSA id e1sm1118204edm.11.2020.10.02.09.31.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Oct 2020 09:31:26 -0700 (PDT)
Date:   Fri, 2 Oct 2020 18:31:24 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] watchdog: cadence: Simplify with dev_err_probe()
Message-ID: <20201002163124.GB6464@kozik-lap>
References: <20200901153141.18960-1-krzk@kernel.org>
 <20200901154952.GA106798@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200901154952.GA106798@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Sep 01, 2020 at 08:49:52AM -0700, Guenter Roeck wrote:
> On Tue, Sep 01, 2020 at 05:31:39PM +0200, Krzysztof Kozlowski wrote:
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and the error value gets printed.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the review. Who could pick up these patches?

Best regards,
Krzysztof
