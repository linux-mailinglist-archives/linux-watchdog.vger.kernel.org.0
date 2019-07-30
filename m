Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8FED79D83
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 02:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729389AbfG3Aoo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 20:44:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40432 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728845AbfG3Aoo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 20:44:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so28110786pla.7;
        Mon, 29 Jul 2019 17:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=3NJEeTqT4Dp47KkcHYTwKVRFWXMdSRE8urDlL9wmwI0=;
        b=phmqClh7eE+jn3T9GYtsPN7hHyXYje3u+i2FKfk5NmFc1BGSI7cR+aPh3YktKWO4kV
         aRXjiZOln0iGP8N1+lK6qIcCeCDl0B5dPXKzfsTQHO1jbjceBhntxukQ9j29BFro49wM
         88SCokNiLw2pJRfC4nw087rBMNuwdjKIwm7mYzyLh7ayzKc9fxAwYXEFGytbLMYhs1LN
         m30CGoMWYHU1JuFqVzF1BgnOQa/VaL9aPYN/dw0EpnOHccwmZkMvmNbwQmU1ISRoAUtp
         LYvEV7S3oPjj5DSIHKkhUJFvyHMARHiwn2gK+Xti4kEpVTGmXM/U40Sw0uDnInuyHFDM
         Zong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=3NJEeTqT4Dp47KkcHYTwKVRFWXMdSRE8urDlL9wmwI0=;
        b=szLcxeAoFY1+7nU2F/7WZwPbKe6mlnQuKyjNfCZLsxuq0wmKksqK32KjmG7NBDw4NB
         YRIKstobQ48rOtEYGyLQjLsFop+GCQZoNJK8f/uquSFw2sq7Il0UuojlLTnwVY+KO3AW
         MnGuOr7XRS4PAOvFxQ8YTjCCbr84vvR0fEzbxq3gdUC7dYLFHLkeGWruG0E/Rmz3V3bG
         avPm4/OdaoSJ5Wx8EF6asfql6f3UUbbN+9wdq0c0vpDLRhplw+jSVzw/eXEynlD0EIOw
         RXXceqjG6dJ6XQsj3Uh9UVyEwh65K558L/hpfio9sgBTQRflfeYtari2mAQJ25f2qRJk
         ib0w==
X-Gm-Message-State: APjAAAViv7fck0YhGJpjnBx9WzlsIynMjYju7VhBN0mjbzRFxSbOh7Wo
        A9HNrdHYw4kyM8QRSE3eaMM=
X-Google-Smtp-Source: APXvYqwUo6UqqusxsnSWl5v/tSMw1jpWJf7S9JaGPQ2CfIQfLMr9U4GbwmG4EI4BUWJpTJLemdvf4A==
X-Received: by 2002:a17:902:424:: with SMTP id 33mr32777157ple.151.1564447483619;
        Mon, 29 Jul 2019 17:44:43 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id z13sm53281860pjn.32.2019.07.29.17.44.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 17:44:43 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 17:44:39 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH] watchdog device drivers:pc87413_wdt: Rewriting of
 pc87413_wdt driver to utilize common watchdog interface (fwd)
In-Reply-To: <8e159e06-023e-6e20-ced5-3a645c0a1242@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907291732130.20898@mbalantz-desktop>
References: <alpine.DEB.2.21.1907291614270.2893@mbalantz-desktop> <8e159e06-023e-6e20-ced5-3a645c0a1242@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello all, Guenter,

I am being evaluated as a student by my organization. I appreciate your 
patience with my emails and patches.

I would like to please propose that we divide and conquer: I write the 
code for converting the driver to common watchdog interface (and I thank 
you for your guidance on it in previous email) and you test the code on 
the actual hardware you may happen to have, as I do not have it. I accept 
the fact that it is indeed risky without the hardware to ensure the driver 
works correctly, but that will be where we work in tandem, software to 
hardware, yes, if that's alright?

I think it's better if I use git send-email for the corresponding patch 
with the improvements you forecasted since it may format things better and 
may result in a non-corrupted patching.

Thank you,
Mark

