Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BDD7D200
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Aug 2019 01:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfGaXhH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 19:37:07 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35127 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfGaXhH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 19:37:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id u14so32745403pfn.2;
        Wed, 31 Jul 2019 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=HkJbMijve+37uAnT22qDE+Z0CK5Fv6mxxx9Tamb2xfY=;
        b=lzIcHkSbX+PlBpxPfBNMHvVgD6toyym4cqqPUTR7YzdyqH4zbgv30GXBxCV29BLaUs
         gfO7IWNMN1zfVgt3g9qMGJC86MFHEio2/9AZBKNKCNbNmHwk6QKnY/s+A+6HQcEvKg3o
         Go6XKFK6uVSayITl/+Q6tKmfwK2oPhM2LoYzStg5hX7M3qbYHTP6qmryZpy433ul+gEC
         22JrNP7nUE2B4B6Y5uVMciZWXPfnbJLG40vo5XZlUh5sMT7EcRezxE5u5XU7k/Qgdy3T
         /nM/n0Id0y/NZT7WKp4OvO42Sh15ro9FY5Lze9Z71eYebYwtBE0XVWeVh2QTOA/T1Qoz
         86Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=HkJbMijve+37uAnT22qDE+Z0CK5Fv6mxxx9Tamb2xfY=;
        b=UcikxRXRwwMa8Y5NDMNa8UOlvOSDK/aWgTxrhndunJz0MpSSGoJNzNquQRXwuvcTg3
         l8drS8qgEY9RaiowNbLgjYbC1bvcp1jIcGXaFfYXtcMQKs0U6ggj/M03zI6d+gzgWWPg
         g+Y/0L5gPcN70okBQ3i8kJDpg85VYdUYY9eeEWTLOCNV86jC/KXU+zeID/9D9iY8EkzG
         e31xJ2FLPPEDH+E+qWGQMVHNezF1cVTElyu+V4faXKmxo3rXJ4HMc7jlGdDlGFpw5I+Y
         Oa0euTFoEICIp5WgcXvyviBTGR6WpaE9wIwLKCfGyAgP5QevI90r0lmaPoVMLlGRZHPU
         /NKw==
X-Gm-Message-State: APjAAAUCNsAAfrJxU3eRODpS4wbmgG4rDQjNIDZ9KHEIc29GEs/vsAug
        nrAWGBo7zKrvgw2kDJlD1Q1xjsriRSc=
X-Google-Smtp-Source: APXvYqwwaerEeV1TDEGtvr7CR7wMLtz0X532yMDm9O+OQlXmPRUFBa9WS8plLiKxG5iCAj+K+KXjvg==
X-Received: by 2002:a17:90b:949:: with SMTP id dw9mr5320838pjb.49.1564616226781;
        Wed, 31 Jul 2019 16:37:06 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id b16sm112490514pfo.54.2019.07.31.16.37.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 16:37:06 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Wed, 31 Jul 2019 16:37:02 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
In-Reply-To: <20190731192410.GA4935@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907311620010.2747@mbalantz-desktop>
References: <20190718155238.3066-1-mbalant3@gmail.com> <20190718163458.GA18125@roeck-us.net> <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop> <20190731164337.GA13646@roeck-us.net> <alpine.DEB.2.21.1907311118190.81695@mbalantz-desktop>
 <20190731192410.GA4935@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter, all,

 	I don't really understand this focus on fixing theoretic/irrelevant
 	race conditions in drivers which no one uses anymore. Maybe someone
 	can enlighten me ?

In conjunction with linuxtesting.org and The Linux Foundation, I've been 
enlisted to test and work on helping to test tools they use for 
reliability testing of linux-based systems. In particular, two tools, 
RaceHound (whose command is 'lines2insns' and which isolates race 
conditions in kernel modules) and Klever, which is browser-based, are
under continual development by the Center and I aim to help them improve
their throughput by aiding in investigating where, in the automated nature
particularly of Klever (requiring considerable configuration as well),
there may areas to improve.

Hence, yes, a large amount of our findings result in manifesting as 
theoretical and possible only, but relevant to improving the tools 
nonetheless.

Hope that helps with the 'enlightening' :), regards,
Mark
