Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA05579EE6
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jul 2019 04:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbfG3CsA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 22:48:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44727 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730760AbfG3CsA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 22:48:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so29229286pgl.11;
        Mon, 29 Jul 2019 19:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=jWYfU1jYaSGV+LhFx50XtpqiC0SX7hxlhvxRl9ry8HQ=;
        b=ZmjX1L6NHGq2f58VCh7Txf7lstlKz0iKTs3lzK/qU96oWtimllm+Kzv5X2ITSzVG8T
         kgg22W1+enEkeaSm7VSlHRZB4pOzDuUXbavZDG2tIXaGkGzzuUabVirM/hOkqcqhKmpu
         Qq9sTmUYMS6hgM1v37xxCb68CaGEHTdlS8UWns4ZfIUQnw3nqqDROQWLJU4fJynQKA1w
         iJPGg8PwXJd8RzsxTvDJ4KEr0qYhWTEN//2WnV4NZeuSwmFhQ/wxhKrtXOxQH63oZZN4
         lPuV4j6D/8KfAeEfQb4ehM8T0orezaK1X5qpgpYryorDnSn3ALih9rnaI/y82ywYKiht
         2dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=jWYfU1jYaSGV+LhFx50XtpqiC0SX7hxlhvxRl9ry8HQ=;
        b=m9p1UdQTVTBJQfGxBCfPnI8iw70RQ8wwmtMC7Mdt8ryhTRSIkC7AMTHntwFTbK53VD
         L8Taa2xCMI5b5j9J4mLevX4lvO58EDDqaDbzcLpEOK2tDQr4hbCMV/AQvR1memy263SU
         MR9DY0Et0PN69p1ygrZ21qMWTWVCwhdsvQHFemoQyNA6s470O6ewVM1xyEuqx89dKSVI
         nCDhx1IZmR/gIrLlho/pPVivncsOWNkXHNod5oPLL+Xg4F6Sw5IFuUXAOX7uPLNVZvMF
         8P9H3BHeIpGGRK9eiuC8za9KnI4gsdeKalaoQVf8283FsiWLO+Ag0QxJ0dbi7Pa2O5yF
         zicg==
X-Gm-Message-State: APjAAAVMOnQwJEITAZ954KYt+3C409OeX4jwQ8EgiueSE5HSQG3oa5tf
        Lw5rdOi4J9+YoA8qwNNmiMI=
X-Google-Smtp-Source: APXvYqzkkNOkfXWo0GWINXk3JSea3VolpDz5dDOF8pQFVnABSddbUpbTyLpGOQSZwkWspIeieuMGXw==
X-Received: by 2002:a17:90a:1ac5:: with SMTP id p63mr112799476pjp.25.1564454879392;
        Mon, 29 Jul 2019 19:47:59 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id u7sm56813510pgr.94.2019.07.29.19.47.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 19:47:58 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 19:47:54 -0700 (PDT)
To:     Guenter Roeck <linux@roeck-us.net>
cc:     Mark Balantzyan <mbalant3@gmail.com>, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        andrianov@ispras.ru
Subject: Re: [PATCH 1/4] watchdog device drivers:pc87413_wdt:Rewriting of
 pc87413_wdt driver to utilize common watchdog interface
In-Reply-To: <792afc6c-f705-a048-4e6d-81d00754c0ea@roeck-us.net>
Message-ID: <alpine.DEB.2.21.1907291947330.103354@mbalantz-desktop>
References: <20190730021540.66579-1-mbalant3@gmail.com> <792afc6c-f705-a048-4e6d-81d00754c0ea@roeck-us.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1861962599-1564454878=:103354"
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1861962599-1564454878=:103354
Content-Type: text/plain; format=flowed; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

Yes, each time I go through an edit I discover something I missed,
apologies. Will be working on it for a bit, currently getting compile time
errors. Just letting you know and it¢s good we¢re checking :-)

Thank you,
Mark

--8323329-1861962599-1564454878=:103354--
