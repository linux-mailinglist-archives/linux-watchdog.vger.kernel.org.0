Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 891E3801BF
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 22:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388153AbfHBUaw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Aug 2019 16:30:52 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33947 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbfHBUaw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Aug 2019 16:30:52 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so34079918plt.1;
        Fri, 02 Aug 2019 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=uIv4ooMEd7klhCY0zT5seExgFzJOyNypU0WtuZa/T3g=;
        b=T5nj3ozEPhXNknpcDcmiad3kRONom8SJGR7CjDLJJbV1c/YoTT9BOW3TTD+6/IH4il
         Z0+6SQuiQVvOFTl4n546zHvGyBSlaYbgiJvZ5KyhrnXCjbJPIZS79/EuoSjmtmBYeAYQ
         5wU/4AeQtEeyegE3Jifqt/P3cihOjsUGJl29DGpJJ3CR309HzIOIbWiLWqOgROfCQ/f3
         lKfNITCM4zNVPbZ2VbpoOpov43A+y8MUcA98xCRul3hQF30DHTCOMxjtdeNa8KpzVBeF
         F3YT/Do7HieCO/sbJtIGq5V69Ec2ifFJqjLeEE2Rk6lUWt/s8Xj4FTlej0pV/RUSTwkL
         q18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=uIv4ooMEd7klhCY0zT5seExgFzJOyNypU0WtuZa/T3g=;
        b=UzQ06noYL1yGWYfAesp6w0ubts99KU4olX3zv5iI0p7wliv/Wk44cRUdiT86xqLDlz
         7pfIlM0hxr5mf+IrwkBcOjk1X2TZwglshpTpDNE8nRbS/qrgx8GtD738omxxveT28Gp4
         SqeMBBr62kW42eVrLqIUrGXoHvhMTjv2oreva3MDydAHgU6yPD8VpOHORNO5mcwpEJe5
         HgMudU9fsE1j3SSh3NHlq5vWMKFy8DxP7kFeIspi3WBUdYYMqO1Ls2sPYgpFt0ofxgQp
         zagadCeQyavK4hw7LlgLMGUxxxcmJsenrGwogxPnDdChUtuqHgNQw7CUJE1Q9XDJNU4h
         NV6Q==
X-Gm-Message-State: APjAAAWk5TyTxPCkqrzAYMFt8pyRLGCRs/fdaMjhYtLFizZpyPl7QDkZ
        HzWqUvTXA9L++XorZScv/1qnk2i8QxI=
X-Google-Smtp-Source: APXvYqyv8inPZIrrT9LI4PEd9q/9Je3cbbG8XA4p5HBkgwb2+OnFCkwSvDYMJymG20qtXXsQvujYyQ==
X-Received: by 2002:a17:902:f082:: with SMTP id go2mr139448946plb.25.1564777851316;
        Fri, 02 Aug 2019 13:30:51 -0700 (PDT)
Received: from [192.168.1.4] (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id r18sm79712514pfg.77.2019.08.02.13.30.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 13:30:50 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@exun.local>
Date:   Fri, 2 Aug 2019 13:30:43 -0700 (PDT)
To:     Mark Balantzyan <mbalant3@gmail.com>
cc:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: alim1535: Rewriting of alim1535 driver to
 use watchdog subsystem
In-Reply-To: <20190802041218.66127-1-mbalant3@gmail.com>
Message-ID: <alpine.OSX.2.21.1908021324160.6704@exun.local>
References: <20190802041218.66127-1-mbalant3@gmail.com>
User-Agent: Alpine 2.21 (OSX 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Dear Ondrej,

As advised by another kernel maintainer, patches for antiquated drivers 
like these (this one which I test-built successfully) should hang around 
until someone with the hardware volunteers to test it. Therefore, I would 
provide the software and the individual would serve as the hardware tester 
with the provided software. So far, I've worked with Guenter Roeck to 
conform it to the watchdog subsystem. And now I'm letting it sit until 
someone with the hardware is able to test it.

Thank you,
Mark

