Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E96C7E7E7
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Apr 2019 18:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfD2Qic (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Apr 2019 12:38:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36428 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfD2Qic (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Apr 2019 12:38:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id w20so4711494plq.3
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Apr 2019 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nf4mmdmobXXOx/354gX9d2hvc+z1btHfI2TitslW52M=;
        b=iHJRs2PIHI+Kyk7Pcha5uia7QlT095SrlEb+5DxhbG7N8o4UKkhyWNEqKAv0GHp7fp
         k6yyu3kn11ALADxcxnTnCw93cYvLQ3S7sIDoQRod3UMVz3YzNT3dW30dZdW9S77J/aJ/
         7+KjNmvJgdlBHfBmtFy5Yy5MGfQmfvCm5nm3767PjLuuMrY+LNwyIx119MKxx4ifIgQo
         OWCm/ZKgixZ9tgnoHmE7AwUky35I8Ya0YmNQhe76Rg4q2nv3ei1yJiEAqX78y4yStf51
         EUhKpAtofrfzjwOOHV8uqPjFimh7oaN7t6gHC0Mw5hHXtitbAQ5QkMnc+qtq8wgqX1II
         YtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nf4mmdmobXXOx/354gX9d2hvc+z1btHfI2TitslW52M=;
        b=qH3vUZOsXyzXCpHRTjL9tkyVgkLy+oPgrNzstqjdQuqXM3QQpWb0RrbT7l4RJ0ydCT
         jKi3xcaToRuPK/hPi0KhJF7MPM60V/qfKyb4pXcFDA8F68njChoAaOX9eU1ul/Krk46V
         TAnd8TCfwENCEAcdbkf8YtwewoeHkH3U5iaEX5UuuBGzZGcH1HYo7sdy1NQ8n6MdwU77
         atKqU0LBWwbr0VvJ03JMeQDE9m9yvdFZrAI6fMHiu50UjbsbMeH8rzHrF1TzDLUC4Q4P
         rWqav6UJKoGQqfuTTimpupVzUahdfI2KvkQl2ZLSgKjQxnCh/hJRg5Oq9K3cDSmv2MQB
         RwbA==
X-Gm-Message-State: APjAAAV/jpRqjRLrU65dNARy5xyLhWIbV/9Ts0k6podRKprLdropF5N3
        TjlDtu8Gg3XpJ8CCw8mfpAI=
X-Google-Smtp-Source: APXvYqzDx3IrbO5uGg4ze495+URHKAyoJm5laGk36KG49QN1HXzL7FZ5ctn2YvT6ku16mejqmayO+g==
X-Received: by 2002:a17:902:8490:: with SMTP id c16mr10077346plo.240.1556555911453;
        Mon, 29 Apr 2019 09:38:31 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h187sm58050613pfc.52.2019.04.29.09.38.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 09:38:30 -0700 (PDT)
Date:   Mon, 29 Apr 2019 09:38:29 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Gortmaker <paul.gortmaker@windriver.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/5] watchdog: rtd119x: drop unused module.h include
Message-ID: <20190429163829.GA14260@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-2-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556034515-28792-2-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Apr 23, 2019 at 11:48:31AM -0400, Paul Gortmaker wrote:
> The Kconfig for this driver is:
> 
> config RTD119X_WATCHDOG
>        bool "Realtek RTD118x/RTD129x watchdog support"
> 
> ...and hence it doesn't need to include module.h for anything.
> There are no other signs of unused modular infrastructure.
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
