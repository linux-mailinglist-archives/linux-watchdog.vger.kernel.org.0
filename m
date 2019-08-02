Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD827EB12
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Aug 2019 06:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731234AbfHBEPq (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 2 Aug 2019 00:15:46 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41448 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731216AbfHBEPp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 2 Aug 2019 00:15:45 -0400
Received: by mail-pg1-f194.google.com with SMTP id x15so25029135pgg.8;
        Thu, 01 Aug 2019 21:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=cfDg+mKiZ0HuXQrp/Fkf3c0LIbGGqs1IU/MvMa1VQT8=;
        b=WcuzDmE0zluIFzPuQx0tOrDFaspGNwNkiiAUShmEgjBJt3kraSMVzeZPcs1OjtcoUw
         4sgBtxcVSfBnyQj7Su6+XCx6v0ZBVC0WzbYYzigVY77o1Tpa92q9qT34T7/eP2H5Gp0a
         JBVNrVI2841Rakg5W9PActLrgsgd0SQMQi4CRaj8h9LipoLq8vmqtUKAef2maT8XCSQf
         5J21X0rH9BQLz9XLXQ1fHHQNIT2owYVfrfOROjtVFIAcHiNvFEkUUJ/g6La5lu61Yipk
         ZMn7/e5cW+EE8KU+BvQ0y4wGfo2EWNeSzq0EnXnNma179aepgabAukCZKC1l+n8gEulK
         KjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=cfDg+mKiZ0HuXQrp/Fkf3c0LIbGGqs1IU/MvMa1VQT8=;
        b=UGNzvAl4ObU8bPY6h8I+nq72OXo4eDlXnKhYBn4ncPB/pbr/yJXmgQWDYrvIRZoqST
         B6sSY7Q5jM/+pECtwsF3rPT7yoi5RvoNb8/xTdjuwySnHUSQ3hPQpYVbEdji+XXherhE
         FrWArc8wGZK99Tc8BICKR3KhxIPOKppjbmPeVDxiH1blyPBTrCQC7bOodaEMoagKZqBQ
         +Ac3NnBKY9u/dKSUcimPogjcZk6wc+ogtg6X1r4tKrMZlxHfj5wRj6pZiSbxad+tgFyw
         BWxMsy7vSIjpfOyIFPxWD+mVJa1RLZL3K2n1h9KG39HbiDyNB9u5h5pDywKKzjBlxqYK
         002Q==
X-Gm-Message-State: APjAAAWnXaH3mEnlUp+Hd+PXI7iPnpLkIO0dmwhT9yINRx36cpOQjAhy
        45zavLRZ3bHyyXxfRNMGo5s=
X-Google-Smtp-Source: APXvYqyaZyBBz2OF0r4sMPZNdrkSj6+3GOMT5EcMdF65SXHq6nuJJ2KcNSG1JahEMCto1z4CBisZxg==
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr2256366pjn.136.1564719344921;
        Thu, 01 Aug 2019 21:15:44 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id k14sm3489292pgb.78.2019.08.01.21.15.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 01 Aug 2019 21:15:44 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Thu, 1 Aug 2019 21:15:41 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: alim1535: Rewriting of alim1535 to use
 watchdog subsystem
In-Reply-To: <7e17ddd7-e304-67f0-836c-8ba71c5a6778@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1908012113390.66405@mbalantz-desktop>
References: <20190802032655.54758-1-mbalant3@gmail.com> <7e17ddd7-e304-67f0-836c-8ba71c5a6778@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

There was some sort of filesystem error that cause the wrong file to be 
saved. Hence, yes, possibly there was no difference betwee the v2 and the 
'v4' (which should have been the 'v3'). Since the last one, though 
unchanged from v2, was a changelog-less 'v3', THIS is an actual 'v4'.

Thank you,
Mark

