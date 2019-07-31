Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70CEE7C9D5
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jul 2019 19:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbfGaREc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 31 Jul 2019 13:04:32 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37442 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfGaREc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 31 Jul 2019 13:04:32 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so30785135plr.4;
        Wed, 31 Jul 2019 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=02uZUKd556myZ+F9DbZFuNYIVZOabJKu9/VOGEOym5U=;
        b=dIae7+Igo3ltQMb7FnEbyeio8IyM1uNgubphIg4B+0bi4A7FXCd+qPbZuPLFUcVnqZ
         Tqyb69AUklajqvqq9g8fyvbVW05oBVhwtoIraiBzfXQAqm2XWQvZv41Q5E900YSWSKuh
         Bw2rdB02zsc4MT9LtcYUw4AJB+DCF6NovXIZuudmV/z7JKKXNMc6PwVlmKl3XYGKhkU6
         b3bgtIdJhdNow0Va46Tpd5TcjTDh+ptQ0OWDXMRMOL/kU5U4JWMCfeJ50p1Jl5xI+J2L
         sHq1INFZgEyJyTN81rp2+3VFuqlgkqjI7JxMTYD4DEqyjbVJIl9N/kfiQjxq7/COaMcC
         kZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=02uZUKd556myZ+F9DbZFuNYIVZOabJKu9/VOGEOym5U=;
        b=BAkPj9302L9uYkBjytOaeFebzOgqHjbaVfiaBqO1RoEd+NkoLOaZ+6Dstwi1OLq4MH
         402jDQx+1JPlHI94ZuPzymbB0/FlF0P2UX89B2Ltgc4h0ASP364rH1F5ihgAjhsWQ4zx
         1DYL138OVsXeDTO5TqCENdLxeT9fVTGXdkBd+EYP33fzqygC59/Gk+4l3gcPlRLfN5AZ
         Cxb6vv+uLTxyRC3gQRDybCFF0TLSyQmA6mTtjWE9D14z1qnAYp+raKqki6B1MGDQK/Sv
         q2hh9xZVrUYNjEs2Ps3SpF59JiLHXG2XJ8SwaBSnBcl+DIAwlzySGBejXPFGT1r7v8IK
         e1KQ==
X-Gm-Message-State: APjAAAXI/DHm9uW61gjZ+M9OoPNClsJeR1x6ScQhAdBl5X7gJMkbvmiN
        yTi96P/dIKLDVDVTTyZc0jU=
X-Google-Smtp-Source: APXvYqwGsj0ZGlniKBN07CjFyqECjuTrRu/I0JtIHH8wCdnVnF2MiO69+EFwTXNWPSE7NiazPmCDbA==
X-Received: by 2002:a17:902:112c:: with SMTP id d41mr110771356pla.33.1564592671257;
        Wed, 31 Jul 2019 10:04:31 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id x7sm4800350pga.0.2019.07.31.10.04.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 10:04:30 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Wed, 31 Jul 2019 10:04:26 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Andrianov <andrianov@ispras.ru>
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
In-Reply-To: <20190731164337.GA13646@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907310949440.37824@mbalantz-desktop>
References: <20190718155238.3066-1-mbalant3@gmail.com> <20190718163458.GA18125@roeck-us.net> <alpine.DEB.2.21.1907310911120.29703@mbalantz-desktop> <20190731164337.GA13646@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

My employer (and yes, I am working for the Linux Foundation) has me 
working on analysing race condition warnings in the Linux kernel. They 
have a driver verification project running under the umbrella of the ELISA 
project involved in the research, investigation, experimentation, and 
establishment of linux kernel verification measures and tools.

I actually do have assigned to me coaches and/or mentors that I have been 
corresponding with. They are aware of what is going on and are being cc'd 
to (most of) our emails.

pc87413_wdt was detected by our race condition analysis tool as having 
warning. Even outside this work we've been doing, I've been trying to apply
the reasoning of the race condition analysis tool to different kernel modules,
as part of my menteeship.

I hope you can respect that this is a process primarily for learning and 
experimentation. I'm sorry if I'm creating too much work for you at once. 
If so, let me know and I'll try to spread it out.

Thank you,
Mark
